//
//  SceneDelegate.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    
    let navigationController = UINavigationController()
    let viewController = GistLisBuilder.createListView()
    navigationController.pushViewController(viewController,
                                            animated: false)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
