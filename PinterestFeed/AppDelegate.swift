//
//  AppDelegate.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainTabBarViewController())
        
        setupAppearance()
        
        return true
    }

}

