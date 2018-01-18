//
//  LogResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class GeocacheLogResponse: BaseLogResponse {
    public var cacheCode: String?
    public var isApproved: Bool?
    public var finder: UserResponse?

    public override func mapping(map: Map) {
        super.mapping(map: map)

        cacheCode <- map["CacheCode"]
        isApproved <- map["IsApproved"]
        finder <- map["Finder"]
    }
}
