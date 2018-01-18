//
//  GetGeocacheStatusResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 12.06.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetGeocacheStatusResponse: Mappable {
    var status: StatusResponse?
    var geocacheStatuses: [GeocacheStatusResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        geocacheStatuses <- map["GeocacheStatuses"]
    }
}
