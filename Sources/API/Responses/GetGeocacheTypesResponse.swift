//
//  GetGeocacheTypesResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetGeocacheTypesResponse: Mappable {
    var status: StatusResponse?
    var geocacheTypes: [GeocacheTypesResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        geocacheTypes <- map["GeocacheTypes"]
    }
}
