//
//  DotNetJSONTransform.swift
//  Hamster
//
//  Created by Patrick Steiner on 14.08.16.
//  Copyright © 2016 Patrick Steiner. All rights reserved.
//

import Foundation
import ObjectMapper
import AFDateHelper

open class DotNetJSONTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Date? {
        if let string = value as? String {
            return Date(fromString: string, format: .dotNet)
        }

        return nil
    }

    open func transformToJSON(_ value: Date?) -> String? {
        guard let value = value else { return nil }
        return value.toString()
    }
}
