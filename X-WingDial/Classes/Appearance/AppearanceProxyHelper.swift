//
//  AppearanceProxyHelper.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 18/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

enum AppearanceProxyHelper {

    static func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = .white
        tabBarAppearance.barTintColor = .black

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .black
            UITabBar.appearance(whenContainedInInstancesOf: [UITabBarController.self]).scrollEdgeAppearance = appearance
            UITabBar.appearance(whenContainedInInstancesOf: [UITabBarController.self]).standardAppearance = appearance
        }
    }

    static func customizeUITableView() {
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = .zero
        }
    }
}
