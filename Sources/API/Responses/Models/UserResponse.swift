//
//  UserResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 23/04/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

class UserResponse: Mappable {
    var avatarUrl: String?
    var findCount: Int?
    var galleryImageCount: Int?
    var hideCount: Int?
    var homeCoordinates: HomeCoordinatesResponse?
    var identifier: Int?
    var isAdmin: Bool?
    var memberType: MemberTypeResponse?
    var publicGuid: String?
    var username: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
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

class HomeCoordinatesResponse: Mappable {
    var latitude: Float?
    var longitude: Float?

    required init?(map: Map) { }

    func mapping(map: Map) {
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
    }
}

class MemberTypeResponse: Mappable {
    var memberTypeId: Int?
    var memberTypeName: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        memberTypeId <- map["MemberTypeId"]
        memberTypeName <- map["MemberTypeName"]
    }
}
