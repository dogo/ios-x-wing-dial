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
                                          image: Asset.icBattleDroidOff.image,
                                          selectedImage: Asset.icBattleDroidOn.image)

        // Create UIViewController Tab
        let dialstab = UINavigationController(rootViewController: ActiveDialsViewController())
        dialstab.tabBarItem = UITabBarItem(title: L10n.dials,
                                           image: Asset.icDialOff.image,
                                           selectedImage: Asset.icDialOn.image)

        viewControllers = [homeTab, dialstab]
    }
}
