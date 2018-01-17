//
//  APIConstants.swift
//  Hamster
//
//  Created by Patrick Steiner on 04.08.16.
//  Copyright © 2016 IQ Mobile. All rights reserved.
//

import UIKit

struct APIConstants {
    // MARK: groundspeak api
    // staging
    fileprivate static let stagingServiceName = "GeoachingStaging"
    fileprivate static let stagingRequestTokenURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/request_token"
    fileprivate static let stagingAuthorizeURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/authorize"
    fileprivate static let stagingAccessTokenURL = "https://staging.geocaching.com/OAuth/mobileoauth.ashx/access_token"
    fileprivate static let stagingHost = "staging.api.groundspeak.com"

    // live
    fileprivate static let liveServiceName = "Geocaching"
    fileprivate static let liveRequestTokenURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/request_token"
    fileprivate static let liveAuthorizeURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/authorize"
    fileprivate static let liveAccessTokenURL = "https://www.geocaching.com/OAuth/mobileoauth.ashx/access_token"
    fileprivate static let liveHost = "api.groundspeak.com"

    // currently active api
    static let apiServiceName = APIConstants.liveServiceName
    static let apiRequestTokenURL = APIConstants.liveRequestTokenURL
    static let apiAuthorizeURL = APIConstants.liveAuthorizeURL
    static let apiAccessTokenURL = APIConstants.liveRequestTokenURL
    static let apiHost = APIConstants.liveHost
    static let apiBaseURLPath = "/LiveV6/geocaching.svc/"

    // MARK: URL Scheme
    static let urlScheme = "mysterymerge" // TODO: find a more generic name
    static let oAuthHost = "oauth-callback"
}
