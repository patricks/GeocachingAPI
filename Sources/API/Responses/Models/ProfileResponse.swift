//
//  ProfileResponse.swift
//  Hamster
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

class ProfileResponse: Mappable {
    var favoritePoints: FavoritePointsResponse?
    var geocaches: GeocachesResponse?
    var publicProfile: PublicProfileResponse?
    var souvenirs: [SouvenirsReponse]?
    var stats: StatsReponse?
    var trackables: TrackablesReponse?
    var user: UserResponse?
    var emailData: EmailDataResponse?

    required init?(map: Map) { }

    func mapping(map: Map) {
        favoritePoints <- map["FavoritePoints"]
        geocaches <- map["Geocaches"]
        publicProfile <- map["PublicProfile"]
        souvenirs <- map["Souvenirs"]
        stats <- map["Stats"]
        trackables <- map["Trackables"]
        user <- map["User"]
        emailData <- map["EmailData"]

        // not implemented: Challenges
    }
}

// MARK: Favorite Points

class FavoritePointsResponse: Mappable {
    var accountID: Int?
    var percentCompleteTowardsNextPoint: Int?
    var pointsAvailable: Int?
    var totalPoints: Int?
    var totalUntilNextPoint: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        accountID <- map["AccountID"]
        percentCompleteTowardsNextPoint <- map["PercentCompleteTowardsNextPoint"]
        pointsAvailable <- map["PointsAvailable"]
        totalPoints <- map["TotalPoints"]
        totalUntilNextPoint <- map["TotalUntilNextPoint"]
    }
}

// MARK: Geocaches

class GeocachesResponse: Mappable {
    var benchmarkFindTypes: [GeocacheTypesResponse]?
    var geocacheFindCount: Int?
    var geocacheFindTypes: [GeocacheTypesResponse]?
    var geocacheHideCount: Int?
    var geocacheHideTypes: [GeocacheTypesResponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        benchmarkFindTypes <- map["BenchmarkFindTypes"]
        geocacheFindCount <- map["GeocacheFindCount"]
        geocacheFindTypes <- map["GeocacheFindTypes"]
        geocacheHideCount <- map["GeocacheHideCount"]
        geocacheHideTypes <- map["GeocacheHideTypes"]
    }
}

class GeocacheTypesResponse: Mappable {
    var description: String?
    var geocacheType: GeocacheType? // GeocacheTypeId
    var geocacheTypeName: String?
    var imageURL: String?
    var isContainer: Bool?
    var isGrandfathered: Bool?
    var parentTypeId: Int?
    var userCount: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        description <- map["Description"]
        geocacheType <- (map["GeocacheTypeId"], EnumTransform<GeocacheType>())
        geocacheTypeName <- map["GeocacheTypeName"]
        imageURL <- map["ImageURL"]
        isContainer <- map["IsContainer"]
        isGrandfathered <- map["IsGrandfathered"]
        parentTypeId <- map["ParentTypeId"]
        userCount <- map["UserCount"]
    }
}

// MARK: Public Profile

class PublicProfileResponse: Mappable {
    var forumTitle: String?
    var lastVisit: Date?
    var location: String?
    var memberSince: Date?
    var occupation: String?
    var profilePhoto: ProfilePhotoResponse?
    var profileText: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        forumTitle <- map["ForumTitle"]
        lastVisit <- (map["LastVisit"], DotNetJSONTransform())
        location <- map["Location"]
        memberSince <- (map["MemberSince"], DotNetJSONTransform())
        occupation <- map["Occupation"]
        profilePhoto <- map["ProfilePhoto"]
        profileText <- map["ProfileText"]
    }
}

class ProfilePhotoResponse: Mappable {
    var photoDescription: String?
    var photoFilename: String?
    var photoName: String?
    var photoURL: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        photoDescription <- map["PhotoDescription"]
        photoFilename <- map["PhotoFilename"]
        photoName <- map["PhotoName"]
        photoURL <- map["PhotoUrl"]
    }
}

// MARK: Souvenirs

class SouvenirsReponse: Mappable {
    var aboutTheArtist: String?
    var artistName: String?
    var artistURL: String?
    var cacheID: Int?
    var coordinates: String?
    var countryID: Int?
    var creatorGUID: String?
    var creatorID: Int?
    var creatorName: String?
    var creatorURL: String?
    var dateDiscovered: Date?
    var dateRangeEnd: Date?
    var dateRangeStart: Date?
    var difficulty: Float?
    var favoritePoints: Int?
    var feedback: String?
    var hidden: Bool?
    var howFound: Int?
    var ignoreLocation: Bool?
    var imagePath: String?
    var information: String?
    var isActive: Bool?
    var isApproved: Int?
    var luaPath: String?
    var souvenirGuid: String?
    var souvenirID: Int?
    var souvenirType: Int?
    var stateID: Int?
    var terrain: Float?
    var thumbPath: String?
    var title: String?
    var totalAwarded: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        aboutTheArtist <- map["AboutTheArtist"]
        artistName <- map["ArtistName"]
        artistURL <- map["ArtistURL"]
        cacheID <- map["CacheID"]
        coordinates <- map["Coordinates"]
        countryID <- map["CountryID"]
        creatorGUID <- map["CreatorGUID"]
        creatorID <- map["CreatorID"]
        creatorName <- map["CreatorName"]
        creatorURL <- map["CreatorURL"]
        dateDiscovered <- (map["DateDiscovered"], DotNetJSONTransform())
        dateRangeEnd <- (map["DateRangeEnd"], DotNetJSONTransform())
        dateRangeStart <- (map["DateRangeStart"], DotNetJSONTransform())
        difficulty <- map["Difficulty"]
        favoritePoints <- map["FavoritePoints"]
        feedback <- map["Feedback"]
        hidden <- map["Hidden"]
        howFound <- map["HowFound"]
        ignoreLocation <- map["IgnoreLocation"]
        imagePath <- map["ImagePath"]
        information <- map["Information"]
        isActive <- map["IsActive"]
        isApproved <- map["IsApproved"]
        luaPath <- map["LuaPath"]
        souvenirGuid <- map["SouvenirGuid"]
        souvenirID <- map["SouvenirID"]
        souvenirType <- map["SouvenirType"]
        stateID <- map["StateID"]
        terrain <- map["Terrain"]
        thumbPath <- map["ThumbPath"]
        title <- map["Title"]
        totalAwarded <- map["TotalAwarded"]
    }
}

// MARK: Stats

class StatsReponse: Mappable {
    var accountsLogged: Int?
    var activeCaches: Int?
    var activeCountries: Int?
    var newLogs: Int?

    required init?(map: Map) { }

    func mapping(map: Map) {
        accountsLogged <- map["AccountsLogged"]
        activeCaches <- map["ActiveCaches"]
        activeCountries <- map["ActiveCountries"]
        newLogs <- map["NewLogs"]
    }
}

// MARK: Trackables

class TrackablesReponse: Mappable {
    var trackableFindCount: Int?
    var trackableFindTypes: [TrackableTypesReponse]?
    var trackableOwnedCount: Int?
    var trackableOwnedTypes: [TrackableTypesReponse]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        trackableFindCount <- map["TrackableFindCount"]
        trackableFindTypes <- map["TrackableFindTypes"]
        trackableOwnedCount <- map["TrackableOwnedCount"]
        trackableOwnedTypes <- map["TrackableOwnedTypes"]
    }
}

class TrackableTypesReponse: Mappable {
    var allowedToBeCollected: Bool?
    var archived: Bool?
    var bugTypeID: Int?
    var code: String?
    var currentGeocacheCode: String?
    var currentGoal: String?
    var currentOwner: UserResponse?
    var dateCreated: Date?
    var description: String?
    var iconUrl: String?
    var identifier: Int?
    var images: [ImageResponse]?
    var inCollection: Bool?
    var name: String?
    var originalOwner: UserResponse?
    var tBTypeName: String?
    var tBTypeNameSingular: String?
    var trackableLogs: [TrackableLogsResponse]?
    var trackingCode: String?
    var url: String?
    var userCount: Int?
    var wptTypeID: Int?

    // geocaching.com returns a http url, but also delivers icons via https
    var iconUrlHTTPS: String? {
        guard let iconURLString = iconUrl else { return nil }

        return iconURLString.replacingOccurrences(of: "http", with: "https")
    }

    required init?(map: Map) { }

    func mapping(map: Map) {
        allowedToBeCollected <- map["AllowedToBeCollected"]
        archived <- map["Archived"]
        bugTypeID <- map["BugTypeID"]
        code <- map["Code"]
        currentGeocacheCode <- map["CurrentGeocacheCode"]
        currentGoal <- map["CurrentGoal"]
        currentOwner <- map["CurrentOwner"]
        dateCreated <- (map["DateCreated"], DotNetJSONTransform())
        description <- map["Description"]
        iconUrl <- map["IconUrl"]
        identifier <- map["Id"]
        images <- map["Images"]
        inCollection <- map["InCollection"]
        name <- map["Name"]
        originalOwner <- map["OriginalOwner"]
        tBTypeName <- map["TBTypeName"]
        tBTypeNameSingular  <- map["TBTypeNameSingular"]
        trackableLogs <- map["TrackableLogs"]
        trackingCode <- map["TrackingCode"]
        url <- map["Url"]
        userCount <- map["UserCount"]
        wptTypeID <- map["WptTypeID"]
    }
}

class TrackableLogsResponse: BaseLogResponse {
    var cacheID: Int?
    var logGuid: String?
    var loggedBy: UserResponse?

    override func mapping(map: Map) {
        super.mapping(map: map)

        cacheID <- map["CacheID"]
        logGuid <- map["LogGuid"]
        loggedBy <- map["LoggedBy"]
    }
}

// MARK: Email Data

class EmailDataResponse: Mappable {
    var isValidated: Bool?

    required init?(map: Map) { }

    func mapping(map: Map) {
        isValidated <- map["IsValidated"]
    }
}
