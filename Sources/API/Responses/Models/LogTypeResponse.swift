//
//  LogTypeResponse.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 23.04.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper

public class LogTypeResponse: Mappable {
    public enum LogType: Int {
        case unarchiveA = 1 // Don't know why there are 2 unarchive types
        case foundIt = 2
        case didntFindIt = 3
        case writeNote = 4
        case archive = 5
        case permanentlyArchived = 6
        case needsArchived = 7
        case willAttend = 9
        case attended = 10
        case webcamPhotoTaken = 11
        case unarchive = 12
        case retrieveItFromaCache = 13
        case droppedOff = 14
        case transfer = 15
        case markMissing = 16
        case postReviewerNoteA = 18 // Don't know why there are 2 types
        case grabIt = 19
        case temporarilyDisableListing = 22
        case enableListing = 23
        case publishListing = 24
        case retractListing = 25
        case needsMaintenance = 45
        case ownerMaintenance = 46
        case updateCoordinates = 47
        case discoveredIt = 48
        case postReviewerNote = 68
        case moveToCollection = 69
        case moveToInventory = 70
        case announcement = 74
        case visited = 75
        case submitForReview = 76

        public static var geocacheLogTypeIds: [Int] {
            return [2, 3, 4, 5, 7, 11, 22, 23, 45, 46, 47]
        }

        public static var eventLogTypeIds: [Int] {
            return [4, 9, 10, 74]
        }

        // TODO: remove this? or add localized strings file
        public var localizedName: String {
            switch self {
            case .unarchiveA, .unarchive:
                return NSLocalizedString("log.type.unarchive", comment: "Log type: Unarchive")
            case .foundIt:
                return NSLocalizedString("log.type.foundit", comment: "Log type: Found it")
            case .didntFindIt:
                return NSLocalizedString("log.type.didntFindIt", comment: "Log type: Didn't find it")
            case .writeNote:
                return NSLocalizedString("log.type.writeNote", comment: "Log type: Write note")
            case .archive:
                return NSLocalizedString("log.type.archive", comment: "Log type: Archive")
            case .permanentlyArchived:
                return NSLocalizedString("log.type.permanentlyArchived", comment: "Log type: Permanently Archived")
            case .needsArchived:
                return NSLocalizedString("log.type.needsArchived", comment: "Log type: Needs Archived")
            case .willAttend:
                return NSLocalizedString("log.type.willAttend", comment: "Log type: Will Attend")
            case .attended:
                return NSLocalizedString("log.type.attended", comment: "Log type: Will Attended")
            case .webcamPhotoTaken:
                return NSLocalizedString("log.type.webcamPhotoTaken", comment: "Log type: Webcam Photo Taken")
            case .retrieveItFromaCache:
                return NSLocalizedString("log.type.retrieveItFromaCache", comment: "Log type: Retrieve It from a Cache")
            case .droppedOff:
                return NSLocalizedString("log.type.droppedOff", comment: "Log type: Dropped Off")
            case .transfer:
                return NSLocalizedString("log.type.transfer", comment: "Log type: Transfer")
            case .markMissing:
                return NSLocalizedString("log.type.markMissing", comment: "Log type: Mark Missing")
            case .postReviewerNote, .postReviewerNoteA:
                return NSLocalizedString("log.type.postReviewerNote", comment: "Log type: Post Reviewer Note")
            case .grabIt:
                return NSLocalizedString("log.type.grabIt", comment: "Log type: Grab It (Not from a Cache)")
            case .temporarilyDisableListing:
                return NSLocalizedString("log.type.temporarilyDisableListing", comment: "Log type: Temporarily Disable Listing")
            case .enableListing:
                return NSLocalizedString("log.type.enableListing", comment: "Log type: Enable Listing")
            case .publishListing:
                return NSLocalizedString("log.type.publishListing", comment: "Log type: Publish Listing")
            case .retractListing:
                return NSLocalizedString("log.type.retractListing", comment: "Log type: Retract Listing")
            case .needsMaintenance:
                return NSLocalizedString("log.type.needsMaintenance", comment: "Log type: Needs Maintenance")
            case .ownerMaintenance:
                return NSLocalizedString("log.type.ownerMaintenance", comment: "Log type: Owner Maintenance")
            case .updateCoordinates:
                return NSLocalizedString("log.type.updateCoordinates", comment: "Log type: Update Coordinates")
            case .discoveredIt:
                return NSLocalizedString("log.type.discoveredIt", comment: "Log type: Discovered It")
            case .moveToCollection:
                return NSLocalizedString("log.type.moveToCollection", comment: "Log type: Move To Collection")
            case .moveToInventory:
                return NSLocalizedString("log.type.moveToInventory", comment: "Log type: Move To Inventory")
            case .announcement:
                return NSLocalizedString("log.type.announcement", comment: "Log type: Announcement")
            case .visited:
                return NSLocalizedString("log.type.visited", comment: "Log type: Visited")
            case .submitForReview:
                return NSLocalizedString("log.type.submitForReview", comment: "Log type: Submit for Review")
            }
        }

        public var imageURL: String {
            switch self {
            case .unarchiveA, .unarchive:
                return urlStringForImage(name: "12")
            case .foundIt:
                return urlStringForIcon(name: "icon_smile")
            case .didntFindIt:
                return urlStringForIcon(name: "icon_sad")
            case .writeNote, .transfer:
                return urlStringForIcon(name: "icon_note")
            case .archive, .permanentlyArchived:
                return urlStringForIcon(name: "traffic_cone")
            case .needsArchived:
                return urlStringForIcon(name: "icon_remove")
            case .willAttend:
                return urlStringForIcon(name: "icon_rsvp")
            case .attended:
                return urlStringForIcon(name: "icon_attended")
            case .webcamPhotoTaken:
                return urlStringForIcon(name: "icon_camera")
            case .retrieveItFromaCache:
                return urlStringForIcon(name: "picked_up")
            case .droppedOff:
                return urlStringForIcon(name: "dropped_off")
            case .markMissing:
                return urlStringForImage(name: "16")
            case .postReviewerNoteA, .postReviewerNote:
                return urlStringForIcon(name: "big_smile")
            case .grabIt:
                return urlStringForIcon(name: "transfer")
            case .temporarilyDisableListing:
                return urlStringForIcon(name: "icon_disabled")
            case .enableListing:
                return urlStringForIcon(name: "icon_enabled")
            case .publishListing:
                return urlStringForIcon(name: "icon_greenlight")
            case .retractListing:
                return urlStringForIcon(name: "icon_redlight")
            case .needsMaintenance:
                return urlStringForIcon(name: "icon_needsmaint")
            case .ownerMaintenance:
                return urlStringForIcon(name: "icon_maint")
            case .updateCoordinates:
                return urlStringForIcon(name: "coord_update")
            case .discoveredIt:
                return urlStringForIcon(name: "icon_discovered")
            case .moveToCollection, .moveToInventory:
                return urlStringForImage(name: "19")
            case .announcement:
                return urlStringForIcon(name: "icon_announcement")
            case .visited:
                return urlStringForIcon(name: "icon_visited")
            case .submitForReview:
                return urlStringForImage(name: "76")
            }
        }

        private func urlStringForIcon(name: String) -> String {
            return "https://www.geocaching.com/images/icons/\(name).gif"
        }

        private func urlStringForImage(name: String) -> String {
            return "https://www.geocaching.com/images/logtypes/\(name).png"
        }
    }

    public var adminActionable: Bool?
    public var imageName: String?
    public var imageURL: String?
    public var ownerActionable: Bool?
    public var wptLogType: LogType?
    public var wptLogTypeName: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        adminActionable <- map["AdminActionable"]
        imageName <- map["ImageName"]
        imageURL <- map["ImageURL"]
        ownerActionable <- map["OwnerActionable"]
        wptLogType <- (map["WptLogTypeId"], EnumTransform<LogType>())
        wptLogTypeName <- map["WptLogTypeName"]
    }
}
