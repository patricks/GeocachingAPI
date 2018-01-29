//
//  APIManager.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 10.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift
import ObjectMapper
import AlamofireObjectMapper

public class GeocachingAPI {
    private var oAuthSwiftManager: OAuth1Swift?

    public init() {}

    // MARK: Validation Handler

    public func apiStatusResponseHandler(request: URLRequest?, response: HTTPURLResponse, data: Data?) -> Request.ValidationResult {
        if response.statusCode != 200 {
            return .failure(APIError.statusCode)
        }

        if let data = data {
            let jsonWithObjectRoot = try? JSONSerialization.jsonObject(with: data, options: [])

            if let rootDictionary = jsonWithObjectRoot as? [String: Any] {
                if let statusDictionary = rootDictionary["Status"] as? [String: Any] {
                    if let statusCode = statusDictionary["StatusCode"] as? Int, statusCode != 0 {
                        if statusCode == GeocachingErrorCode.authentication.rawValue {
                            // Logging out, because it looks like, that the api token expired
                            self.logout()
                            return .failure(APIError.geocachingAuthentication)
                        } else if statusCode == GeocachingErrorCode.geocacheCanOnlyHaveSingleCorrectedCoordinate.rawValue {
                            return .failure(APIError.geocacheCanOnlyHaveSingleCorrectedCoordinate)
                        }
                        return .failure(APIError.geocachingGeneral)
                    }
                }
            }
        }
        return .success
    }

    // MARK: OAuth

    public static func setupAPI(apiConsumerKey: String, apiConsumerSecret: String, oAuthUrlScheme: String) {
        SettingsManager.apiConsumerKey = apiConsumerKey
        SettingsManager.apiConsumerSecret = apiConsumerSecret
        SettingsManager.urlScheme = oAuthUrlScheme
    }

    public static func handle(url: URL) {
        OAuthSwift.handle(url: url)
    }

    public static var isLoggedIn: Bool {
        return SettingsManager.isLoggedIn
    }

    public static var loggedInUsername: String? {
        return SettingsManager.username
    }

    private var loggedIn = false {
        didSet {
            SettingsManager.isLoggedIn = loggedIn
        }
    }

    public func signIn(_ viewController: UIViewController?, completion: @escaping (_ successful: Bool, _ error: Error?) -> Void) {
        guard let apiConsumerKey = SettingsManager.apiConsumerKey,
            let apiConsumerSecrect = SettingsManager.apiConsumerSecret,
            let urlScheme = SettingsManager.urlScheme else {
                completion(false, nil)
                return
        }

        oAuthSwiftManager = OAuth1Swift(
            consumerKey: apiConsumerKey,
            consumerSecret: apiConsumerSecrect,
            requestTokenUrl: APIConstants.apiRequestTokenURL,
            authorizeUrl: APIConstants.apiAuthorizeURL,
            accessTokenUrl: APIConstants.apiAccessTokenURL
        )

        guard let oAuthSwiftManager = oAuthSwiftManager else {
            completion(false, nil)
            return
        }

        if let viewController = viewController {
            oAuthSwiftManager.authorizeURLHandler = SafariURLHandler(viewController: viewController, oauthSwift: oAuthSwiftManager)
        }

        guard let oAuthURL = URL(string: "\(urlScheme)://\(APIConstants.oAuthHost)/geocaching") else {
            completion(false, nil)
            return
        }

        oAuthSwiftManager.authorize(withCallbackURL: oAuthURL,
                                    success: { (credential, response, parameters) in
                                        self.storeUser(apiToken: credential.oauthToken)
                                        completion(true, nil)
        }, failure: { error in
            completion(false, error)
        })
    }

    public func logout() {
        self.loggedIn = false
    }

    private func storeUser(apiToken: String) {
        SettingsManager.apiToken = apiToken
        self.loggedIn = true

        // get user profile to store the username
        getYourUserProfile()
    }

    // API Infos: https://api.groundspeak.com/LiveV6/geocaching.svc/help

    // MARK: API Profile

    /**
     Get the own profile.
     */
    public func getYourUserProfile(_ completion: ((_ successful: Bool, _ geocacher: ProfileResponse?, _ error: Error?) -> Void)? = nil) {
        guard let token = SettingsManager.apiToken else {
            completion?(false, nil, APIError.noToken)
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
                    completion?(false, nil, error)
                }
        }
    }

    private func storeUserProfile(_ profileResponse: ProfileResponse) {
        guard let username = profileResponse.user?.username else { return }

        SettingsManager.username = username
    }

    /**
     Get cache counts for the given users.
     */
    public func getUsersCacheCounts(usernames: [String],
                                    completion: @escaping (_ successful: Bool, _ cacheCounts: [UserCacheCountsResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noToken)
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
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get another users profile.
     */
    public func getAnotherUsersProfile(userID: Int, completion: @escaping (_ successful: Bool, _ geocacher: ProfileResponse?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noToken)
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
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get users geocache logs.
     */
    public func getUsersGeocacheLogs(username: String,
                                     startIndex: Int = 0,
                                     maxPerPage: Int = 30,
                                     completion: @escaping (_ successful: Bool, _ geocacheLogs: [GeocacheLogResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noToken)
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
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get users image gallery.
     */
    public func getUserGallery(username: String,
                               startIndex: Int = 0,
                               maxPerPage: Int = 30,
                               completion: @escaping (_ successful: Bool, _ images: [ImageResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, APIError.noToken)
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
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get status of geocaches.
    */
    public func getGeocacheStatus(cacheCodes: [String], completion: @escaping (_ successful: Bool, _ statuses: [GeocacheStatusResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getGeocacheStatus(accessToken: token, cacheCodes: cacheCodes)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetGeocacheStatusResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.geocacheStatuses, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get API limits.
    */
    public func getAPILimits(completion: @escaping (_ successful: Bool, _ apiLimits: LimitsResponse?, _ maxPerPage: MaxPerPageResponse?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil, nil)
            return
        }

        let request = APIRequest.getApiLimits(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetAPILimitsResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.limits, value.maxPerPage, nil)

                case .failure(let error):
                    completion(false, nil, nil, error)
                }
        }
    }

    /**
     Get geocache types.
     */
    public func getGeocacheTypes(completion: @escaping (_ successful: Bool, _ geocacheTypes: [GeocacheTypesResponse]?, _ error: Error?) -> Void) {
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
                    completion(false, nil, error)
                }
        }
    }

    /**
     Save user waypoint.
     */
    public func saveWaypoint(cacheCode: String, latitude: Double, longitude: Double, correctedCoordinate: Bool, completion: @escaping (_ successful: Bool, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil)
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
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
        }
    }

    /**
     Get user waypoints.
    */
    public func getUserWaypoints(cacheCode: String, completion: @escaping (_ successful: Bool, _ waypoints: [WaypointResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getUserWaypoints(accessToken: token, cacheCode: cacheCode)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetUserWaypointsResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.waypoints, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get corrected coordinates waypoint.
     */
    public func getCorrectedCoordinates(cacheCode: String, completion: @escaping (_ successful: Bool, _ waypoint: WaypointResponse?, _ error: Error?) -> Void) {
        getUserWaypoints(cacheCode: cacheCode) { [weak self] (successful, waypoints, error) in
            completion(successful, self?.correctedCoordinatesFromUserWaypoints(waypoints), error)
        }
    }

    private func correctedCoordinatesFromUserWaypoints(_ waypoints: [WaypointResponse]?) -> WaypointResponse? {
        guard let waypoints = waypoints else { return nil }

        let correctedCoordinatesWaypoints = waypoints.filter { $0.isCorrectedCoordinate == true }

        return correctedCoordinatesWaypoints.first
    }

    /**
     Delete a user waypoint.
     */
    public func deleteWaypoint(waypointId: Int, completion: @escaping (_ successful: Bool, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil)
            return
        }

        let request = APIRequest.deleteUserWaypoint(accessToken: token, waypointId: waypointId)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<DeleteUserWaypointResponse>) in
                switch response.result {
                case .success(_):
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
        }
    }

    /**
     Get membership types.
     */
    public func getMembershipTypes(completion: @escaping (_ successful: Bool, _ membershipTypes: [MembershipResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getMembershipTypes(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetMembershipTypesResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.memberships, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get bookmark lists for current user.
     */
    public func getBookmarkListsForUser(completion: @escaping (_ successful: Bool, _ bookmarkLists: [BookmarkListsResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getBookmarkListsForUser(accessToken: token)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetBookmarkListsResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.bookmarkLists, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get bookmark lists by user id.
     */
    public func getBookmarkListsByUserID(userID: String, completion: @escaping (_ successful: Bool, _ bookmarkLists: [BookmarkListsResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getBookmarkListsByUserID(accessToken: token, userID: userID)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetBookmarkListsResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.bookmarkLists, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }

    /**
     Get bookmark list by guid.
     */
    public func getBookmarkListByGuid(bookmarkListGuid: String, completion: @escaping (_ successful: Bool, _ bookmarkLists: [BookmarkListResponse]?, _ error: Error?) -> Void) {
        guard let token = SettingsManager.apiToken else {
            completion(false, nil, nil)
            return
        }

        let request = APIRequest.getBookmarkListByGuid(accessToken: token, bookmarkListGuid: bookmarkListGuid)

        Alamofire.request(request)
            .validate(apiStatusResponseHandler)
            .responseObject { (response: DataResponse<GetBookmarkListByGuidResponse>) in
                switch response.result {
                case .success(let value):
                    completion(true, value.bookmarkLists, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
    }
}
