//
//  StatusResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class StatusResponse: Mappable {
    public var statusCode: Int?
    public var statusMessage: String?
    public var exceptionDetails: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        statusCode <- map["StatusCode"]
        statusMessage <- map["StatusMessage"]
        exceptionDetails <- map["ExceptionDetails"]

        // TODO: implemented: Warnings
    }
}
