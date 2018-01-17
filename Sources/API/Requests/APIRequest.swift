//
//  APIRequest.swift
//  Hamster
//
//  Created by Patrick Steiner on 10.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import Alamofire

enum APIRequest: URLRequestConvertible {
    // API Requests
    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetYourUserProfile
    case getYourUserProfile(accessToken: String)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetAnotherUsersProfile
    case getAnotherUsersProfile(accessToken: String, userID: Int)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetUsersCacheCounts
    case getUsersCacheCounts(accessToken: String, usernames: [String])

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetUsersGeocacheLogs
    case getUsersGeocacheLogs(accessToken: String, username: String, startIndex: Int, maxPerPage: Int)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetGeocacheTypes
    case getGeocacheTypes(accessToken: String)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetUserGallery
    case getUserGallery(accessToken: String, username: String, startIndex: Int, maxPerPage: Int)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetGeocacheStatus
    case getGeocacheStatus(accessToken: String, cacheCodes: [String])

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/GetAPILimits
    case getApiLimits(accessToken: String)

    // https://api.groundspeak.com/LiveV6/geocaching.svc/help/operations/SaveUserWaypoint
    case saveUserWaypoint(accessToken: String, cacheCode: String, latitude: Double, longitude: Double, correctedCoordinate: Bool)

    var method: HTTPMethod {
        switch self {
        case .getUsersCacheCounts(_),
             .getYourUserProfile(_),
             .getAnotherUsersProfile(_),
             .getUserGallery(_),
             .getUsersGeocacheLogs(_),
             .getGeocacheStatus(_),
             .saveUserWaypoint(_):
            return .post
        case .getGeocacheTypes(_),
             .getApiLimits(_):
            return .get
        }
    }

    // URL Path
    var apiURL: URL {
        // https://api.groundspeak.com/LiveV6/geocaching.svc/help
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = APIConstants.apiHost

        var apiPath = ""
        switch self {
        case .getUsersCacheCounts(_):
            apiPath = "GetUsersCacheCounts"
        case .getYourUserProfile(_):
            apiPath = "GetYourUserProfile"
        case .getAnotherUsersProfile(_):
            apiPath = "GetAnotherUsersProfile"
        case .getUsersGeocacheLogs(_):
            apiPath = "GetUsersGeocacheLogs"
        case .getGeocacheTypes(_):
            apiPath = "GetGeocacheTypes"
        case .getUserGallery(_):
            apiPath = "GetUserGallery"
        case .getGeocacheStatus(_):
            apiPath = "GetGeocacheStatus"
        case .getApiLimits(_):
            apiPath = "GetAPILimits"
        case .saveUserWaypoint(_):
            apiPath = "SaveUserWaypoint"
        }

        urlComponents.path = APIConstants.apiBaseURLPath + apiPath

        let formatQueryItem = URLQueryItem(name: "format", value: "json")
        urlComponents.queryItems = [formatQueryItem]

        return urlComponents.url!
    }

    // URL Parameters
    var parameters: Parameters {
        switch self {
        case .getUsersCacheCounts(let accessToken, let usernames):
            return ["AccessToken": accessToken, "Usernames": usernames]
        case .getYourUserProfile(let accessToken):
            let options = ["ChallengesData": false,
                           "FavoritePointsData": true,
                           "GeocacheData": true,
                           "PublicProfileData": true,
                           "SouvenirData": true,
                           "TrackableData": true,
                           "EmailData": true]

            return ["AccessToken": accessToken, "ProfileOptions": options]
        case .getAnotherUsersProfile(let accessToken, let userID):
            let options = ["ChallengesData": false,
                           "FavoritePointsData": true,
                           "GeocacheData": true,
                           "PublicProfileData": true,
                           "SouvenirData": true,
                           "TrackableData": true]

            return ["AccessToken": accessToken, "UserID": userID, "ProfileOptions": options]
        case .getUsersGeocacheLogs(let accessToken, let username, let startIndex, let maxPerPage):
            let logTypes = LogTypeResponse.LogType.geocacheLogTypeIds +
                LogTypeResponse.LogType.eventLogTypeIds

            return ["AccessToken": accessToken,
                    "Username": username,
                    "LogTypes": logTypes,
                    "ExcludeArchived": false,
                    "StartIndex": startIndex,
                    "MaxPerPage": maxPerPage]
        case .getGeocacheTypes(let accessToken),
             .getApiLimits(let accessToken):
            return ["AccessToken": accessToken]
        case .getUserGallery(let accessToken, let username, let startIndex, let maxPerPage):
            return ["AccessToken": accessToken,
                    "Username": username,
                    "StartIndex": startIndex,
                    "MaxPerPage": maxPerPage]
        case .getGeocacheStatus(let accessToken, let cacheCodes):
            return ["AccessToken": accessToken,
                    "CacheCodes": cacheCodes]
        case .saveUserWaypoint(let accessToken, let cacheCode, let latitude, let longitude, let correctedCoordinate):
            return ["AccessToken": accessToken,
                    "CacheCode": cacheCode,
                    "Latitude": latitude,
                    "Longitude": longitude,
                    "IsCorrectedCoordinate": correctedCoordinate]
        }
    }

    // URL Request
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: apiURL)
        urlRequest.httpMethod = method.rawValue

        if method == .get {
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        }

        return try JSONEncoding.default.encode(urlRequest, with: parameters)
    }
}