//
//  AppDelegate.swift
//  BestDealMedication
//
//  Created by Macbook on 12/6/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
//import Crashlytics
//import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.window?.rootViewController = vc
        
        return true
    }
}

