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
        tabBarAppearance.barTintColor = ColorPalette.appTheme.color

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = ColorPalette.appTheme.color
            UITabBar.appearance(whenContainedInInstancesOf: [UITabBarController.self]).scrollEdgeAppearance = appearance
            UITabBar.appearance(whenContainedInInstancesOf: [UITabBarController.self]).standardAppearance = appearance
        }
    }

    static func customizeUITableView() {
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = .zero
            UITableViewHeaderFooterView.appearance().tintColor = ColorPalette.appSeconday.color
        }
    }

    static func customizeNavigationBar() {
        if #available(iOS 13.0, *) {
            // Set the standard appearance
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = ColorPalette.appTheme.color

            UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = navBarAppearance

            // Set the scroll edge appearance
            let scrollNavBarAppearance = UINavigationBarAppearance()
            scrollNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            scrollNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            scrollNavBarAppearance.backgroundColor = ColorPalette.appTheme.color

            UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = scrollNavBarAppearance
            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().tintColor = .white
        } else {
            let navigationBarAppearance = UINavigationBar.appearance()
            navigationBarAppearance.tintColor = .white
            navigationBarAppearance.barStyle = .black
            navigationBarAppearance.isTranslucent = true
            navigationBarAppearance.barTintColor = ColorPalette.appTheme.color
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}
