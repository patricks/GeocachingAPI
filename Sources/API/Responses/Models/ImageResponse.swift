//
//  ImageResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 23/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageResponse: Mappable {
    var dateCreated: Date?
    var description: String?
    var imageGuid: String?
    var mobileURL: String?
    var name: String?
    var thumbUrl: String?
    var url: String?

    init() { }
    required init?(map: Map) { }

    func mapping(map: Map) {
        dateCreated <- (map["DateCreated"], DotNetJSONTransform())
        description <- map["Description"]
        imageGuid <- map["ImageGuid"]
        mobileURL <- map["MobileUrl"]
        name <- map["Name"]
        thumbUrl <- map["ThumbUrl"]
        url <- map["Url"]
    }
}
