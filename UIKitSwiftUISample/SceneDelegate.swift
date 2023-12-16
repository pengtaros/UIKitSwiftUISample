//
//  SceneDelegate.swift
//  UIKitSwiftUISample
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        window.makeKeyAndVisible()
        let vc = MainViewController()
        window.rootViewController = vc
    }

}

