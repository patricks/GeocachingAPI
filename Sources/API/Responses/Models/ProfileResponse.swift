//
//  ProfileResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

public class ProfileResponse: Mappable {
    public var favoritePoints: FavoritePointsResponse?
    public var geocaches: GeocachesResponse?
    public var publicProfile: PublicProfileResponse?
    public var souvenirs: [SouvenirsReponse]?
    public var stats: StatsReponse?
    public var trackables: TrackablesReponse?
    public var user: UserResponse?
    public var emailData: EmailDataResponse?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        favoritePoints <- map["FavoritePoints"]
        geocaches <- map["Geocaches"]
        publicProfile <- map["PublicProfile"]
        souvenirs <- map["Souvenirs"]
        stats <- map["Stats"]
        trackables <- map["Trackables"]
        user <- map["User"]
        emailData <- map["EmailData"]

        // TODO: not implement: challenges
    }
}

// MARK: Favorite Points

public class FavoritePointsResponse: Mappable {
    public var accountID: Int?
    public var percentCompleteTowardsNextPoint: Int?
    public var pointsAvailable: Int?
    public var totalPoints: Int?
    public var totalUntilNextPoint: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        accountID <- map["AccountID"]
        percentCompleteTowardsNextPoint <- map["PercentCompleteTowardsNextPoint"]
        pointsAvailable <- map["PointsAvailable"]
        totalPoints <- map["TotalPoints"]
        totalUntilNextPoint <- map["TotalUntilNextPoint"]
    }
}

// MARK: Geocaches

public class GeocachesResponse: Mappable {
    public var benchmarkFindTypes: [GeocacheTypesResponse]?
    public var geocacheFindCount: Int?
    public var geocacheFindTypes: [GeocacheTypesResponse]?
    public var geocacheHideCount: Int?
    public var geocacheHideTypes: [GeocacheTypesResponse]?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        benchmarkFindTypes <- map["BenchmarkFindTypes"]
        geocacheFindCount <- map["GeocacheFindCount"]
        geocacheFindTypes <- map["GeocacheFindTypes"]
        geocacheHideCount <- map["GeocacheHideCount"]
        geocacheHideTypes <- map["GeocacheHideTypes"]
    }
}

public class GeocacheTypesResponse: Mappable {
    public var description: String?
    public var geocacheType: GeocacheType? // GeocacheTypeId
    public var geocacheTypeName: String?
    public var imageURL: String?
    public var isContainer: Bool?
    public var isGrandfathered: Bool?
    public var parentTypeId: Int?
    public var userCount: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
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

public class PublicProfileResponse: Mappable {
    public var forumTitle: String?
    public var lastVisit: Date?
    public var location: String?
    public var memberSince: Date?
    public var occupation: String?
    public var profilePhoto: ProfilePhotoResponse?
    public var profileText: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        forumTitle <- map["ForumTitle"]
        lastVisit <- (map["LastVisit"], DotNetJSONTransform())
        location <- map["Location"]
        memberSince <- (map["MemberSince"], DotNetJSONTransform())
        occupation <- map["Occupation"]
        profilePhoto <- map["ProfilePhoto"]
        profileText <- map["ProfileText"]
    }
}

public class ProfilePhotoResponse: Mappable {
    public var photoDescription: String?
    public var photoFilename: String?
    public var photoName: String?
    public var photoURL: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        photoDescription <- map["PhotoDescription"]
        photoFilename <- map["PhotoFilename"]
        photoName <- map["PhotoName"]
        photoURL <- map["PhotoUrl"]
    }
}

// MARK: Souvenirs

public class SouvenirsReponse: Mappable {
    public var aboutTheArtist: String?
    public var artistName: String?
    public var artistURL: String?
    public var cacheID: Int?
    public var coordinates: String?
    public var countryID: Int?
    public var creatorGUID: String?
    public var creatorID: Int?
    public var creatorName: String?
    public var creatorURL: String?
    public var dateDiscovered: Date?
    public var dateRangeEnd: Date?
    public var dateRangeStart: Date?
    public var difficulty: Double?
    public var favoritePoints: Int?
    public var feedback: String?
    public var hidden: Bool?
    public var howFound: Int?
    public var ignoreLocation: Bool?
    public var imagePath: String?
    public var information: String?
    public var isActive: Bool?
    public var isApproved: Int?
    public var luaPath: String?
    public var souvenirGuid: String?
    public var souvenirID: Int?
    public var souvenirType: Int?
    public var stateID: Int?
    public var terrain: Double?
    public var thumbPath: String?
    public var title: String?
    public var totalAwarded: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
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

public class StatsReponse: Mappable {
    public var accountsLogged: Int?
    public var activeCaches: Int?
    public var activeCountries: Int?
    public var newLogs: Int?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        accountsLogged <- map["AccountsLogged"]
        activeCaches <- map["ActiveCaches"]
        activeCountries <- map["ActiveCountries"]
        newLogs <- map["NewLogs"]
    }
}

// MARK: Trackables

public class TrackablesReponse: Mappable {
    public var trackableFindCount: Int?
    public var trackableFindTypes: [TrackableTypesReponse]?
    public var trackableOwnedCount: Int?
    public var trackableOwnedTypes: [TrackableTypesReponse]?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        trackableFindCount <- map["TrackableFindCount"]
        trackableFindTypes <- map["TrackableFindTypes"]
        trackableOwnedCount <- map["TrackableOwnedCount"]
        trackableOwnedTypes <- map["TrackableOwnedTypes"]
    }
}

public class TrackableTypesReponse: Mappable {
    public var allowedToBeCollected: Bool?
    public var archived: Bool?
    public var bugTypeID: Int?
    public var code: String?
    public var currentGeocacheCode: String?
    public var currentGoal: String?
    public var currentOwner: UserResponse?
    public var dateCreated: Date?
    public var description: String?
    public var iconUrl: String?
    public var identifier: Int?
    public var images: [ImageResponse]?
    public var inCollection: Bool?
    public var name: String?
    public var originalOwner: UserResponse?
    public var tBTypeName: String?
    public var tBTypeNameSingular: String?
    public var trackableLogs: [TrackableLogsResponse]?
    public var trackingCode: String?
    public var url: String?
    public var userCount: Int?
    public var wptTypeID: Int?

    // geocaching.com returns a http url, but also delivers icons via https
    public var iconUrlHTTPS: String? {
        guard let iconURLString = iconUrl else { return nil }

        return iconURLString.replacingOccurrences(of: "http", with: "https")
    }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
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

public class TrackableLogsResponse: BaseLogResponse {
    public var cacheID: Int?
    public var logGuid: String?
    public var loggedBy: UserResponse?

    public override func mapping(map: Map) {
        super.mapping(map: map)

        cacheID <- map["CacheID"]
        logGuid <- map["LogGuid"]
        loggedBy <- map["LoggedBy"]
    }
}

// MARK: Email Data

public class EmailDataResponse: Mappable {
    public var isValidated: Bool?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        isValidated <- map["IsValidated"]
    }
}
