//
//  BaseLogResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 23/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseLogResponse: Mappable {
    var cannotDelete: Bool?
    var code: String?
    var guid: String?
    var identifier: Int?
    var images: [ImageResponse]?
    var isArchived: Bool?
    var logIsEncoded: Bool?
    var logText: String?
    var logType: LogTypeResponse?
    var utcCreateDate: Date?
    var updatedLatitude: Float?
    var updatedLongitude: Float?
    var url: String?
    var visitDate: Date?
    var visitDateIso: Date?
    var ianaTimezoneId: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
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
