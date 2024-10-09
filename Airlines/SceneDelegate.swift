//
//  SceneDelegate.swift
//  Airlines
//
//  Created by Ricardo Altavista on 07/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let flightService = FlightService()
        
        let flightViewModel = FlightViewModel(flightService: flightService)

        window = UIWindow(windowScene: windowScene)
        
        let viewController = FlightsViewController(viewModel: flightViewModel)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}
