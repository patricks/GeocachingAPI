//
//  LimitResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class LimitResponse: Mappable {
    var cacheLimits: [CacheLimitResponse]?
    var enforceCacheLimits: Bool?
    var enforceLiteCacheLimits: Bool?
    var enforceMethodLimits: Bool?
    var forMembershipType: Int?
    var licenseKey: String?
    var liteCacheLimits: [CacheLimitResponse]?
    var maxCallsbyIPIn1Minute: Int?
    var methodLimits: [MethodLimitResponse]?
    var restrictbyIP: Bool?
    var validateIPCounts: Bool?

    required init?(map: Map) { }

    func mapping(map: Map) {
        cacheLimits <- map["CacheLimits"]
        enforceCacheLimits <- map["EnforceCacheLimits"]
        enforceLiteCacheLimits <- map["EnforceLiteCacheLimits"]
        enforceMethodLimits <- map["EnforceMethodLimits"]
        forMembershipType <- map["ForMembershipType"]
        licenseKey <- map["LicenseKey"]
        liteCacheLimits <- map["LiteCacheLimits"]
        maxCallsbyIPIn1Minute <- map["MaxCallsbyIPIn1Minute"]
        methodLimits <- map["MethodLimits"]
        restrictbyIP <- map["RestrictbyIP"]
        validateIPCounts <- map["ValidateIPCounts"]
    }
}

class CacheLimitResponse: Mappable {
    var cacheLimit: Int?
    var inMinutes: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        cacheLimit <- map["CacheLimit"]
        inMinutes <- map["InMinutes"]
    }
}

class MethodLimitResponse: Mappable {
    var inMinutes: Int?
    var maxCalls: Int?
    var methodName: String?
    var partnerMethod: Bool?

    required init?(map: Map) { }

    func mapping(map: Map) {
        inMinutes <- map["InMinutes"]
        maxCalls <- map["MaxCalls"]
        methodName <- map["MethodName"]
        partnerMethod <- map["PartnerMethod"]
    }
}
