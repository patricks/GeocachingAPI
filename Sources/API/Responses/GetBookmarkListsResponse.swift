//
//  GetBookmarkListsForUserResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 25.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class GetBookmarkListsResponse: Mappable {
    var status: StatusResponse?
    var bookmarkLists: [BookmarkListsResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        status <- map["Status"]
        bookmarkLists <- map["BookmarkLists"]
    }
}
