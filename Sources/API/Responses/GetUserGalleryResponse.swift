//
//  GetUserGalleryResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 08.06.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetUserGalleryResponse: Mappable {
    var status: StatusResponse?
    var images: [ImageResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        images <- map["GalleryImages"]
    }
}
