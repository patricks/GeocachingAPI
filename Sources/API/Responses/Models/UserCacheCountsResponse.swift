//
//  UserCacheCounts.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 01.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserCacheCountsResponse: Mappable {
    public var cacheFinds: Int?
    public var cacheHides: Int?
    public var userID: Int?
    public var username: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        cacheFinds <- map["CacheFinds"]
        cacheHides <- map["CacheHides"]
        userID <- map["UserID"]
        username <- map["Username"]
    }
}
