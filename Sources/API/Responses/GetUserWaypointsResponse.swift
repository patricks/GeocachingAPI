//
//  GetUserWaypointsResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 21.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetUserWaypointsResponse: Mappable {
    var status: StatusResponse?
    var waypoints: [WaypointResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        waypoints <- map["UserWaypoints"]
    }
}
