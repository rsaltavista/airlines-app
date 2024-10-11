//
//  SceneDelegate.swift
//  Airlines
//
//  Created by Ricardo Altavista on 07/10/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeView = HomeView()
        
        let flightService = FlightService()
        
        let flightViewModel = FlightViewModel(flightService: flightService)
        
        let hostingController = UIHostingController(rootView: homeView)
        
        let navigationController = UINavigationController(rootViewController: hostingController)


        window = UIWindow(windowScene: windowScene)
                
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}
