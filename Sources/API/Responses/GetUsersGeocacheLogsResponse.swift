//
//  GetUsersGeocacheLogsResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetUsersGeocacheLogsResponse: Mappable {
    var status: StatusResponse?
    var logs: [GeocacheLogResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        logs <- map["Logs"]
    }
}
