//
//  APIError.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 05.07.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation

public enum GeocachingErrorCode: Int {
    case authentication = 3
    case geocacheCanOnlyHaveSingleCorrectedCoordinate = 155
}

public enum APIError: Error {
    case statusCode
    case geocachingGeneral
    case geocachingAuthentication
    case noToken
    case geocacheCanOnlyHaveSingleCorrectedCoordinate
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .statusCode:
            return "HTTP Status Code Error"
        case .geocachingGeneral:
            return "Geocaching.com General Error"
        case .geocachingAuthentication:
            return "Geocaching.com Authentication Error"
        case .noToken:
            return "No API token stored"
        case .geocacheCanOnlyHaveSingleCorrectedCoordinate:
            return "A geocache can only have a single corrected coordinate record"
        }
    }
}
