//
//  GeocacheStatusResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 12.06.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class GeocacheStatusResponse: Mappable {
    public var archived: Bool?
    public var available: Bool?
    public var cacheCode: String?
    public var cacheName: String?
    public var geocacheType: GeocacheType?
    public var premium: Bool?
    public var trackableCount: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        archived <- map["Archived"]
        available <- map["Available"]
        cacheCode <- map["CacheCode"]
        cacheName <- map["CacheName"]
        geocacheType <- (map["CacheType"], EnumTransform<GeocacheType>())
        premium <- map["Premium"]
        trackableCount <- map["TrackableCount"]
    }
}
