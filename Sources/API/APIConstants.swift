//
//  APIConstants.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 04.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import UIKit

struct APIConstants {

    // MARK: groundspeak api

    // staging
    private static let stagingServiceName = "GeoachingStaging"
    private static let stagingRequestTokenURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/request_token"
    private static let stagingAuthorizeURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/authorize"
    private static let stagingAccessTokenURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/access_token"
    private static let stagingHost = "staging.api.groundspeak.com"

    // live
    private static let liveServiceName = "Geocaching"
    private static let liveRequestTokenURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/request_token"
    private static let liveAuthorizeURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/authorize"
    private static let liveAccessTokenURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/access_token"
    private static let liveHost = "api.groundspeak.com"

    // currently active api
    static let apiServiceName = APIConstants.liveServiceName
    static let apiRequestTokenURL = APIConstants.liveRequestTokenURL
    static let apiAuthorizeURL = APIConstants.liveAuthorizeURL
    static let apiAccessTokenURL = APIConstants.liveRequestTokenURL
    static let apiHost = APIConstants.liveHost
    static let apiBaseURLPath = "/LiveV6/geocaching.svc/"

    // MARK: URL Scheme
    
    static let oAuthHost = "oauth-callback"
}
