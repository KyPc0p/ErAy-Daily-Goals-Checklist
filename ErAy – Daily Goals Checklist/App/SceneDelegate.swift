//
//  SceneDelegate.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 31.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: GoalsListViewController())
        window?.makeKeyAndVisible()
    }
  
}

