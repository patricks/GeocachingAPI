//
//  WaypointResponse.swift
//  MysteryMergeiOS
//
//  Created by Patrick Steiner on 16.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

class WaypointResponse: Mappable {
    var associatedAdditionalWaypoint: String?
    var cacheCode: String?
    var description: String?
    var id: Int?
    var isCorrectedCoordinate: Bool?
    var isUserCompleted: Bool?
    var latitude: Double?
    var longitude: Double?
    var utcDate: Date?
    var userId: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        associatedAdditionalWaypoint <- map["AssociatedAdditionalWaypoint"]
        cacheCode <- map["CacheCode"]
        description <- map["Description"]
        id <- map["ID"]
        isCorrectedCoordinate <- map["IsCorrectedCoordinate"]
        isUserCompleted <- map["IsUserCompleted"]
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
        utcDate <- (map["UTCDate"], DotNetJSONTransform())
        userId <- map["UserID"]
    }
}
