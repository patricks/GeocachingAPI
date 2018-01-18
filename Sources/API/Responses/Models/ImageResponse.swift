//
//  ImageResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class ImageResponse: Mappable {
    public var dateCreated: Date?
    public var description: String?
    public var imageGuid: String?
    public var mobileURL: String?
    public var name: String?
    public var thumbUrl: String?
    public var url: String?

    public init() { }
    public required init?(map: Map) { }

    public func mapping(map: Map) {
        dateCreated <- (map["DateCreated"], DotNetJSONTransform())
        description <- map["Description"]
        imageGuid <- map["ImageGuid"]
        mobileURL <- map["MobileUrl"]
        name <- map["Name"]
        thumbUrl <- map["ThumbUrl"]
        url <- map["Url"]
    }
}
