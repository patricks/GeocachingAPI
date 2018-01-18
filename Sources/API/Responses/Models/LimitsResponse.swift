//
//  LimitResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 11.11.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class LimitsResponse: Mappable {
    public var cacheLimits: [CacheLimitResponse]?
    public var enforceCacheLimits: Bool?
    public var enforceLiteCacheLimits: Bool?
    public var enforceMethodLimits: Bool?
    public var forMembershipType: Int?
    public var licenseKey: String?
    public var liteCacheLimits: [CacheLimitResponse]?
    public var maxCallsbyIPIn1Minute: Int?
    public var methodLimits: [MethodLimitResponse]?
    public var restrictbyIP: Bool?
    public var validateIPCounts: Bool?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
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

public class CacheLimitResponse: Mappable {
    public var cacheLimit: Int?
    public var inMinutes: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        cacheLimit <- map["CacheLimit"]
        inMinutes <- map["InMinutes"]
    }
}

public class MethodLimitResponse: Mappable {
    public var inMinutes: Int?
    public var maxCalls: Int?
    public var methodName: String?
    public var partnerMethod: Bool?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        inMinutes <- map["InMinutes"]
        maxCalls <- map["MaxCalls"]
        methodName <- map["MethodName"]
        partnerMethod <- map["PartnerMethod"]
    }
}
