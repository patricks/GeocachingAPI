//
//  DeleteUserWaypointResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 21.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class DeleteUserWaypointResponse: Mappable {
    var status: StatusResponse?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
    }
}
