//
//  MaxPerPageResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class MaxPerPageResponse: Mappable {
    var geocaches: Int?
    var geocacheLogs: Int?
    var trackables: Int?
    var trackableLogs: Int?
    var cacheNotes: Int?
    var galleryImages: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        geocaches <- map["Geocaches"]
        geocacheLogs <- map["GeocacheLogs"]
        trackables <- map["Trackables"]
        trackableLogs <- map["TrackableLogs"]
        cacheNotes <- map["CacheNotes"]
        galleryImages <- map["GalleryImages"]
    }
}
