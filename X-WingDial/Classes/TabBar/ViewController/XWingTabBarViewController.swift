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
        homeTab.tabBarItem = UITabBarItem(title: L10n.home,
                                          image: UIImage(named: "ic_battle_droid_off"),
                                          selectedImage: UIImage(named: "ic_battle_droid_on"))

        // Create UIViewController Tab
        let dialstab = UINavigationController(rootViewController: ActiveDialsViewController())
        dialstab.tabBarItem = UITabBarItem(title: L10n.dials,
                                           image: UIImage(named: "ic_dial_off"),
                                           selectedImage: UIImage(named: "ic_dial_on"))

        viewControllers = [homeTab, dialstab]
    }
}
