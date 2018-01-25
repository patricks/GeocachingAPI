//
//  BookmarkListsResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 25.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class BookmarkListsResponse: Mappable {
    public var listId: Int?
    public var listGuid: String?
    public var listName: String?
    public var listDescription: String?
    public var numberOfItems: Int?
    public var listIsShared: Bool?
    public var listIsPublic: Bool?
    public var listIsArchived: Bool?
    public var listIsSpecial: Bool?
    public var listTypeId: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        listId <- map["ListID"]
        listGuid <- map["ListGUID"]
        listName <- map["ListName"]
        listDescription <- map["ListDescription"]
        numberOfItems <- map["NumberOfItems"]
        listIsShared <- map["ListIsShared"]
        listIsPublic <- map["ListIsPublic"]
        listIsArchived <- map["ListIsArchived"]
        listIsSpecial <- map["ListIsSpecial"]
        listTypeId <- map["ListTypeID"]
    }
}
