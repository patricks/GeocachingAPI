//
//  GetAPILimitsResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetAPILimitsResponse: Mappable {
    public var status: StatusResponse?
    public var limits: LimitResponse?
    public var maxPerPage: MaxPerPageResponse?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        status <- map["Status"]
        limits <- map["Limits"]
        maxPerPage <- map["MaxPerPage"]
    }
}
