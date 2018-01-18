//
//  APIError.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 05.07.17.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation

public enum GeocachingErrorCode: Int {
    case authenticationError = 3
}

public enum APIError: Error {
    case statusCodeError
    case geocachingGeneralError
    case geocachingAuthenticationError
    case noTokenError
}

// TODO: is this used???
extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .statusCodeError:
            return "HTTP Status Code Error"
        case .geocachingGeneralError:
            return "Geocaching.com General Error"
        case .geocachingAuthenticationError:
            return "Geocaching.com Authentication Error"
        case .noTokenError:
            return "No API token stored"
        }
    }
}
