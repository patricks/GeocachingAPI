//
//  BookmarkListResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 25.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class BookmarkListResponse: Mappable {
    public var cacheCode: String?
    public var cacheTitle: String?
    public var cacheTypeID: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        cacheCode <- map["CacheCode"]
        cacheTitle <- map["CacheTitle"]
        cacheTypeID <- map["CacheTypeID"]
    }
}
