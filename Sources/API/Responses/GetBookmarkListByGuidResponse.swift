//
//  GetBookmarkListByGuidResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 25.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetBookmarkListByGuidResponse: Mappable {
    var status: StatusResponse?
    var bookmarkLists: [BookmarkListResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        bookmarkLists <- map["BookmarkList"]
    }
}
