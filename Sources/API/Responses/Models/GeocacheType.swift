//
//  GeocacheType.swift
//  Hamster
//
//  Created by Patrick Steiner on 12/06/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import UIKit

enum GeocacheType: Int {
    case traditional = 2
    case multi = 3
    case virtual = 4
    case letterboxHybrid = 5
    case event = 6
    case unknown = 8
    case ape = 9
    case webcam = 11
    case locationless = 12
    case cacheInTrashOutEvent = 13
    case earthcache = 137
    case megaEvent = 453
    case gpsAdventuresExhibit = 1304
    case wherigo = 1858
    case lostAndFoundEvent = 3653
    case groundspeakHQ = 3773
    case groundspeakLostAndFoundCelebration = 3774
    case groundspeakBlockParty = 4738
    case gigaEvent = 7005

    static var geocacheTypeIds: [Int] {
        return [2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 137, 453, 1304, 1858, 3653, 3773, 3774, 4738, 7005]
    }

    var imageURL: String {
        return "https://www.geocaching.com/images/wpttypes/\(self.rawValue).gif"
    }

    var localizedName: String {
        switch self {
        case .traditional:
            return NSLocalizedString("cache.type.traditional", comment: "Cache type: Traditional")
        case .multi:
            return NSLocalizedString("cache.type.multi", comment: "Cache type: Multi")
        case .virtual:
            return NSLocalizedString("cache.type.virtual", comment: "Cache type: Virtual")
        case .letterboxHybrid:
            return NSLocalizedString("cache.type.letterbox", comment: "Cache type: Letterbox")
        case .event:
            return NSLocalizedString("cache.type.event", comment: "Cache type: Event")
        case .unknown:
            return NSLocalizedString("cache.type.unknown", comment: "Cache type: Unknown")
        case .ape:
            return NSLocalizedString("cache.type.ape", comment: "Cache type: Ape")
        case .webcam:
            return NSLocalizedString("cache.type.webcam", comment: "Cache type: Webcam")
        case .locationless:
            return NSLocalizedString("cache.type.locationless", comment: "Cache type: Locationless")
        case .cacheInTrashOutEvent:
            return NSLocalizedString("cache.type.cito", comment: "Cache type: CITO")
        case .earthcache:
            return NSLocalizedString("cache.type.earthcache", comment: "Cache type: Earthcache")
        case .megaEvent:
            return NSLocalizedString("cache.type.megaevent", comment: "Cache type: Mega Event")
        case .gpsAdventuresExhibit:
            return NSLocalizedString("cache.type.maze", comment: "Cache type: Maze")
        case .wherigo:
            return NSLocalizedString("cache.type.wherigo", comment: "Cache type: Wherigo")
        case .lostAndFoundEvent:
            return NSLocalizedString("cache.type.lostandfoundevent", comment: "Cache type: Lost and Found Event")
        case .groundspeakHQ:
            return NSLocalizedString("cache.type.groundspeakhq", comment: "Cache type: Groundspeak HQ")
        case .groundspeakLostAndFoundCelebration:
            return NSLocalizedString("cache.type.lostandfoundcelebration", comment: "Cache type: Lost and Found Celebration")
        case .groundspeakBlockParty:
            return NSLocalizedString("cache.type.groundspeakblockparty", comment: "Cache type: Groundspeak BlockParty")
        case .gigaEvent:
            return NSLocalizedString("cache.type.gigaevent", comment: "Cache type: Giga Event")
        }
    }

    var color: UIColor {
        switch self {
        case .traditional, .letterboxHybrid, .groundspeakHQ, .ape:
            return AppDesign.green
        case .multi:
            return AppDesign.yellow
        case .unknown, .wherigo:
            return AppDesign.blue
        case .event,
             .megaEvent,
             .gigaEvent,
             .cacheInTrashOutEvent,
             .gpsAdventuresExhibit,
             .groundspeakBlockParty,
             .groundspeakLostAndFoundCelebration,
             .lostAndFoundEvent:
            return AppDesign.red
        case .virtual, .earthcache, .webcam, .locationless:
            return AppDesign.gray
        }
    }
}
