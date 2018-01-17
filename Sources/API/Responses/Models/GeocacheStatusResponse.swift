//
//  GeocacheStatusResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 12/06/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GeocacheStatusResponse: Mappable {
    var archived: Bool?
    var available: Bool?
    var cacheCode: String?
    var cacheName: String?
    var geocacheType: GeocacheType?
    var premium: Bool?
    var trackableCount: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        archived <- map["Archived"]
        available <- map["Available"]
        cacheCode <- map["CacheCode"]
        cacheName <- map["CacheName"]
        geocacheType <- (map["CacheType"], EnumTransform<GeocacheType>())
        premium <- map["Premium"]
        trackableCount <- map["TrackableCount"]
    }
}
