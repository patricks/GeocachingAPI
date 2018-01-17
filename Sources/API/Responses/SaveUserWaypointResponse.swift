//
//  SaveUserWaypointResponse.swift
//  MysteryMergeiOS
//
//  Created by Patrick Steiner on 16.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class SaveUserWaypointResponse: Mappable {
    var status: StatusResponse?
    var waypoint: WaypointResponse?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        waypoint <- map["NewWaypoint"]
    }
}

