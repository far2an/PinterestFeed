//
//  MainTabBarViewController.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
    }

    private func addControllers() {
        let home = FeedViewController()
        home.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "pinterest"), tag: 0)
        let following = UIViewController()
        following.tabBarItem = UITabBarItem(title: "Following", image: #imageLiteral(resourceName: "friends"), tag: 0)
        let notifications = UIViewController()
        notifications.tabBarItem = UITabBarItem(title: "Notifications", image: #imageLiteral(resourceName: "notification"), tag: 0)
        let saved = UIViewController()
        saved.tabBarItem = UITabBarItem(title: "Saved", image: #imageLiteral(resourceName: "user"), tag: 0)

        viewControllers = [home, following, notifications, saved]

    }

}
