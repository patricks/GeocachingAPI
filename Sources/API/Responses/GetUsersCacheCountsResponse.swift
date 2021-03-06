//
//  GetUsersCacheCountsResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 01.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetUsersCacheCountsResponse: Mappable {
    var status: StatusResponse?
    var userCacheCounts: [UserCacheCountsResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        userCacheCounts <- map["UserCacheCounts"]
    }
}
