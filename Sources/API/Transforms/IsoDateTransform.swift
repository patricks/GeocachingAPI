//
//  IsoDateTransform.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 06/07/2017.
//  Copyright © 2017 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

open class IsoDateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Date? {
        if let string = value as? String {
            return Date(fromString: string, format: .isoDateTimeMilliSec)
        }

        return nil
    }

    open func transformToJSON(_ value: Date?) -> String? {
        guard let value = value else { return nil }
        return value.toString()
    }
}
