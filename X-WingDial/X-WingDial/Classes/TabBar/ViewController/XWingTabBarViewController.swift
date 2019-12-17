//
//  XWingTabBarViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class XWingTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create FactionsViewController Tab
        let homeTab = UINavigationController(rootViewController: FactionsViewController())
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)

        // Create UIViewController Tab
        let Dialstab = UINavigationController(rootViewController: UIViewController())
        Dialstab.tabBarItem = UITabBarItem(title: "Dials", image: nil, selectedImage: nil)

        self.viewControllers = [homeTab, Dialstab]
    }
}
