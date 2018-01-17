//
//  SettingsManager.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 04.08.16.
//  Copyright © 2016 Patrick. All rights reserved.
//

import Foundation

public class SettingsManager {
    // Settings Keys
    private static let apiTokenKey = "apiToken"
    private static let usernameKey = "username"
    private static let loggedInKey = "loggedIn"
    private static let apiConsumerKeyKey = "apiConsumerKey"
    private static let apiConsumerSecretKey = "apiCosumerSecret"

    // MARK: API

    public static var apiToken: String? {
        get {
            return UserDefaults.standard.string(forKey: apiTokenKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: apiTokenKey)
        }
    }

    public static var username: String? {
        get {
            return UserDefaults.standard.string(forKey: usernameKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: usernameKey)
        }
    }

    public static var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: loggedInKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: loggedInKey)

            // logout reset api token
            if newValue == false {
                apiToken = nil
                username = nil
            }
        }
    }

    public static var apiConsumerKey: String? {
        get {
            return UserDefaults.standard.string(forKey: apiConsumerKeyKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: apiConsumerKeyKey)
        }
    }

    public static var apiConsumerSecret: String? {
        get {
            return UserDefaults.standard.string(forKey: apiConsumerSecretKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: apiConsumerSecretKey)
        }
    }
}
