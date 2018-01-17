//
//  APIManager.swift
//  Hamster
//
//  Created by Patrick Steiner on 10.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift
import ObjectMapper
import AlamofireObjectMapper

class GeocachingAPI {
    var oAuthSwiftManager: OAuth1Swift?
    var loggedIn = false {
        didSet {
            SettingsManager.isLoggedIn = loggedIn
        }
    }

    // MARK: Validation Handler

    func apiStatusResponseHandler(request: URLRequest?, response: HTTPURLResponse, data: Data?) -> Request.ValidationResult {
        if response.statusCode != 200 {
//            AnalyticsManager.logError(statusCode: response.statusCode, errorType: .httpStatusCode)
            return .failure(APIError.statusCodeError)
        }

        if let data = data {
            let jsonWithObjectRoot = try? JSONSerialization.jsonObject(with: data, options: [])

            if let rootDictionary = jsonWithObjectRoot as? [String: Any] {
                if let statusDictionary = rootDictionary["Status"] as? [String: Any] {
                    if let statusCode = statusDictionary["StatusCode"] as? Int, statusCode != 0 {
//                        AnalyticsManager.logError(statusCode: statusCode, errorType: .geocachingStatusCode)
                        if statusCode == GeocachingErrorCode.authenticationError.rawValue {

                            // Logging out, because it looks like, that the api token expired
                            self.logout()
                            return .failure(APIError.geocachingAuthenticationError)
                        }
                        return .failure(APIError.geocachingGeneralError)
                    }
                }
            }
        }
        return .success
    }

    // MARK: OAuth

    func signIn(_ viewController: UIViewController?, completion: @escaping (_ successful: Bool) -> Void) {
        guard let apiConsumerKey = SettingsManager.apiConsumerKey,
              let apiConsumerSecrect = SettingsManager.apiConsumerSecret else {
                completion(false)
                return
        }

        oAuthSwiftManager = OAuth1Swift(
            consumerKey: apiConsumerKey,
            consumerSecret: apiConsumerSecrect,
            requestTokenUrl: APIConstants.apiRequestTokenURL,
            authorizeUrl: APIConstants.apiAuthorizeURL,
            accessTokenUrl: APIConstants.apiAccessTokenURL
        )

        if let viewController = viewController {
            oAuthSwiftManager!.authorizeURLHandler = SafariURLHandler(viewController: viewController, oauthSwift: oAuthSwiftManager!)
        }

//        AnalyticsManager.logView(withName: .login)

        oAuthSwiftManager!.authorize(withCallbackURL: URL(string: "\(APIConstants.urlScheme)://\(APIConstants.oAuthHost)/geocaching")!,
                                     success: { (credential, _, _) in
                                        self.storeUser(apiToken: credential.oauthToken)
                                        self.handleBackgroudFetch()
                                        completion(true)
        }, failure: { error in
//            log.error(error.localizedDescription)
//            AnalyticsManager.logLogin(successful: false)
            completion(false)
        })
    }

    func logout() {
        self.loggedIn = false

        handleBackgroudFetch()
    }

    private func storeUser(apiToken: String) {
        SettingsManager.apiToken = apiToken
        self.loggedIn = true

        getYourUserProfile { (successful, profileResponse, _) in
//            if successful {
//                if let username = profileResponse?.user?.username {
////                    AnalyticsManager.logLogin(successful: true, username: username)
//                } else {
////                    AnalyticsManager.logLogin(successful: true)
//                }
//            } else {
////                AnalyticsManager.logLogin(successful: true)
//            }
        }
    }

    private func handleBackgroudFetch() {
//        if let applicationDelegate = UIApplication.shared.delegate as? AppDelegate {
////            applicationDelegate.setupBackgroundFetch()
//        }
    }

    // API Infos: https://api.groundspeak.com/LiveV6/geocaching.svc/help

    // MARK: API Profile

    /**
     Get the own profile.
     */
    func getYourUserProfile(_ completion: ((_ successful: Bool, _ geocacher: ProfileResponse?, _ error: Error?) -> Void)? = nil) {
        guard let token = SettingsManager.apiToken else {
            completion?(false, nil, APIError.noTokenError)
            return
        }

        let request = APIRequest.getYourUserProfile(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUserProfileReponse>) in
                switch response.result {
                case .success(let value):
                    if let profile = value.profile {
                        self.storeUserProfile(profile)

                        completion?(true, profile, nil)
                    }
                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion?(false, nil, error)
                }
        }
    }

    private func storeUserProfile(_ profileResponse: ProfileResponse) {
        guard let username = profileResponse.user?.username else { return }

        SettingsManager.username = username
//        AnalyticsManager.storeUsername(username)
    }

    /**
     Get cache counts for the given users.
     */
    func getUsersCacheCounts(usernames: [String],
                             completion: @escaping (_ successful: Bool, _ cacheCounts: [UserCacheCountsResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noTokenError)
            return
        }

        let request = APIRequest.getUsersCacheCounts(accessToken: token, usernames: usernames)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUsersCacheCountsResponse>) in
                switch response.result {
                case .success(let value):
                    if let userCacheCounts = value.userCacheCounts {
                        completion(true, userCacheCounts, nil)

                    } else {
                        completion(true, nil, nil)
                    }
                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get another users profile.
     */
    func getAnotherUsersProfile(userID: Int, completion: @escaping (_ successful: Bool, _ geocacher: ProfileResponse?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noTokenError)
            return
        }

        let request = APIRequest.getAnotherUsersProfile(accessToken: token, userID: userID)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUserProfileReponse>) in
                switch response.result {
                case .success(let value):
                    if let profile = value.profile {
                        completion(true, profile, nil)
                    }
                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get users geocache logs.
     */
    func getUsersGeocacheLogs(username: String,
                              startIndex: Int = 0,
                              maxPerPage: Int = 30,
                              completion: @escaping (_ successful: Bool, _ geocacheLogs: [GeocacheLogResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noTokenError)
            return
        }

        let request = APIRequest.getUsersGeocacheLogs(accessToken: token,
                                                      username: username,
                                                      startIndex: startIndex,
                                                      maxPerPage: maxPerPage)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUsersGeocacheLogsResponse>) in
                switch response.result {
                case .success(let value):
                    if let logs = value.logs {
                        completion(true, logs, nil)
                    }
                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get users image gallery.
     */
    func getUserGallery(username: String,
                        startIndex: Int = 0,
                        maxPerPage: Int = 30,
                        completion: @escaping (_ successful: Bool, _ images: [ImageResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noTokenError)
            return
        }

        // TODO: check why startIndex and maxPerPage are ignored
        let request = APIRequest.getUserGallery(accessToken: token,
                                                username: username,
                                                startIndex: startIndex,
                                                maxPerPage: maxPerPage)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUserGalleryResponse>) in
                switch response.result {
                case .success(let value):
                    if let images = value.images {
                        completion(true, images, nil)
                    }
                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get status of geocaches.
    */
    func getGeocacheStatus(cacheCodes: [String], completion: @escaping (_ successful: Bool, _ statuses: [GeocacheStatusResponse]?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil)
            return
        }

        let request = APIRequest.getGeocacheStatus(accessToken: token, cacheCodes: cacheCodes)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetGeocacheStatusResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.geocacheStatuses)
                case .failure(let error):
                    print(error.localizedDescription)
//                    log.error(error.localizedDescription)
                    completion(false, nil)
                }
        }
    }

    /**
     Get API limits.
    */
    func getAPILimits(completion: @escaping (_ successful: Bool, _ apiLimits: GetAPILimitsResponse?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getApiLimits(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetAPILimitsResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value, nil)

                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get geocache types.
     */
    func getGeocacheTypes(completion: @escaping (_ successful: Bool, _ geocacheTypes: [GeocacheTypesResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getGeocacheTypes(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetGeocacheTypesResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.geocacheTypes, nil)

                case .failure(let error):
//                    log.error(error.localizedDescription)
                    completion(false, nil, error)
                }
        }
    }

    /**
     Save user waypoint.
     */
    func saveWaypoint(cacheCode: String, latitude: Double, longitude: Double, correctedCoordinate: Bool, completion: @escaping (_ successful: Bool) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false)
            return
        }

        let request = APIRequest.saveUserWaypoint(accessToken: token,
                                                  cacheCode: cacheCode,
                                                  latitude: latitude,
                                                  longitude: longitude,
                                                  correctedCoordinate: correctedCoordinate)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<SaveUserWaypointResponse>) in
                switch response.result {
                case .success(_):
                    completion(true)
                case .failure(let error):
                    print(error.localizedDescription)
//                    log.error(error.localizedDescription)
                    completion(false)
                }
        }
    }
}