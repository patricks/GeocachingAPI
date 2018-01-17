//
//  MaxPerPageResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class MaxPerPageResponse: Mappable {
    public var geocaches: Int?
    public var geocacheLogs: Int?
    public var trackables: Int?
    public var trackableLogs: Int?
    public var cacheNotes: Int?
    public var galleryImages: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        geocaches <- map["Geocaches"]
        geocacheLogs <- map["GeocacheLogs"]
        trackables <- map["Trackables"]
        trackableLogs <- map["TrackableLogs"]
        cacheNotes <- map["CacheNotes"]
        galleryImages <- map["GalleryImages"]
    }
}
