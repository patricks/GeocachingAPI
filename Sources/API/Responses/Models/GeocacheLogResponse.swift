//
//  LogResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 23/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GeocacheLogResponse: BaseLogResponse {
    var cacheCode: String?
    var isApproved: Bool?
    var finder: UserResponse?

    override func mapping(map: Map) {
        super.mapping(map: map)

        cacheCode <- map["CacheCode"]
        isApproved <- map["IsApproved"]
        finder <- map["Finder"]
    }
}
