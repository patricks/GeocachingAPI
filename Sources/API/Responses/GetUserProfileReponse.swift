//
//  GerUserProfileReponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetUserProfileReponse: Mappable {
    var status: StatusResponse?
    var profile: ProfileResponse?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        profile <- map["Profile"]
    }
}
