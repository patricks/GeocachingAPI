//
//  UserCacheCounts.swift
//  Hamster
//
//  Created by Patrick Steiner on 01/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class UserCacheCountsResponse: Mappable {
    var cacheFinds: Int?
    var cacheHides: Int?
    var userID: Int?
    var username: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        cacheFinds <- map["CacheFinds"]
        cacheHides <- map["CacheHides"]
        userID <- map["UserID"]
        username <- map["Username"]
    }
}
