//
//  GetMembershipTypesResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 22.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetMembershipTypesResponse: Mappable {
    var status: StatusResponse?
    var memberships: [MembershipResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        memberships <- map["Memberships"]
    }
}

