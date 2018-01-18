//
//  UserResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserResponse: Mappable {
    public var avatarUrl: String?
    public var findCount: Int?
    public var galleryImageCount: Int?
    public var hideCount: Int?
    public var homeCoordinates: HomeCoordinatesResponse?
    public var identifier: Int?
    public var isAdmin: Bool?
    public var memberType: MemberTypeResponse?
    public var publicGuid: String?
    public var username: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        avatarUrl <- map["AvatarUrl"]
        findCount <- map["FindCount"]
        galleryImageCount <- map["GalleryImageCount"]
        hideCount <- map["HideCount"]
        homeCoordinates <- map["HomeCoordinates"]
        identifier <- map["Id"]
        isAdmin <- map["IsAdmin"]
        memberType <- map["MemberType"]
        publicGuid <- map["PublicGuid"]
        username <- map["UserName"]
    }
}

public class HomeCoordinatesResponse: Mappable {
    public var latitude: Double?
    public var longitude: Double?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
    }
}

public class MemberTypeResponse: Mappable {
    public var memberTypeId: Int?
    public var memberTypeName: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        memberTypeId <- map["MemberTypeId"]
        memberTypeName <- map["MemberTypeName"]
    }
}
