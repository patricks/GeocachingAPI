//
//  AppDelegate.swift
//  GeocachingAPI
//
//  Created by Patrick Steiner on 17.01.18.
//  Copyright © 2018 Patrick Steiner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        SettingsManager.apiConsumerKey = "XXX"
        SettingsManager.apiConsumerSecret = "XXX"

        return true
    }
}

