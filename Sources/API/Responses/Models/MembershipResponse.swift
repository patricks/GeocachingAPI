//
//  MembershipResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 22.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class MembershipResponse: Mappable {
    public var memberTypeId: Int?
    public var memberTypeName: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        memberTypeId <- map["MemberTypeId"]
        memberTypeName <- map["MemberTypeName"]
    }
}
