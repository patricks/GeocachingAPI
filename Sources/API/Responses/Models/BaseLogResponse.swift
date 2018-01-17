//
//  BaseLogResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseLogResponse: Mappable {
    public var cannotDelete: Bool?
    public var code: String?
    public var guid: String?
    public var identifier: Int?
    public var images: [ImageResponse]?
    public var isArchived: Bool?
    public var logIsEncoded: Bool?
    public var logText: String?
    public var logType: LogTypeResponse?
    public var utcCreateDate: Date?
    public var updatedLatitude: Double?
    public var updatedLongitude: Double?
    public var url: String?
    public var visitDate: Date?
    public var visitDateIso: Date?
    public var ianaTimezoneId: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        cannotDelete <- map["CannotDelete"]
        code <- map["Code"]
        guid <- map["Guid"]
        identifier <- map["ID"]
        images <- map["Images"]
        isArchived <- map["IsArchived"]
        logIsEncoded <- map["LogIsEncoded"]
        logText <- map["LogText"]
        logType <- map["LogType"]
        utcCreateDate <- (map["UTCCreateDate"], DotNetJSONTransform())
        updatedLatitude <- map["UpdatedLatitude"]
        updatedLatitude <- map["UpdatedLatitude"]
        updatedLongitude <- map["UpdatedLongitude"]
        url <- map["Url"]
        visitDate <- (map["VisitDate"], DotNetJSONTransform())
        visitDateIso <- (map["VisitDateIso"], IsoDateTransform())
        ianaTimezoneId <- map["IanaTimezoneId"]
    }
}
