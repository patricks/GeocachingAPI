//
//  WaypointResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 16.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

public class WaypointResponse: Mappable {
    public var associatedAdditionalWaypoint: String?
    public var cacheCode: String?
    public var description: String?
    public var id: Int?
    public var isCorrectedCoordinate: Bool?
    public var isUserCompleted: Bool?
    public var latitude: Double?
    public var longitude: Double?
    public var utcDate: Date?
    public var userId: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
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
