//
//  GetAPILimitsResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetAPILimitsResponse: Mappable {
    var status: StatusResponse?
    var limits: LimitResponse?
    var maxPerPage: MaxPerPageResponse?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        limits <- map["Limits"]
        maxPerPage <- map["MaxPerPage"]
    }
}
