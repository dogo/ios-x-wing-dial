//
//  SceneDelegate.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

         let viewController = ViewController()

         // Use a UIHostingController as window root view controller.
         if let windowScene = scene as? UIWindowScene {
             let window = UIWindow(windowScene: windowScene)
             window.rootViewController = viewController
             self.window = window
             window.makeKeyAndVisible()
         }
    }
}
