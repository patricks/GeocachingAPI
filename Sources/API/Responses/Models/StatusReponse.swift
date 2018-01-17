//
//  StatusResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class StatusResponse: Mappable {
    var statusCode: Int?
    var statusMessage: String?
    var exceptionDetails: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        statusCode <- map["StatusCode"]
        statusMessage <- map["StatusMessage"]
        exceptionDetails <- map["ExceptionDetails"]

        // TODO: implemented: Warnings
    }
}
