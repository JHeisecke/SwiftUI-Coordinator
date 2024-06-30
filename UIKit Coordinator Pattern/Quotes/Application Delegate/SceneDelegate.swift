//
//  SceneDelegate.swift
//  Quotes
//
//  Created by Javier Heisecke on 2024-06-30.
//  Copyright © 2024 Code Foundry. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let coordinator = AppCoordinator()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            if let window = self.window {
                window.rootViewController = coordinator.rootViewController
                window.makeKeyAndVisible()
                coordinator.start()
            }
        }
    }
}
