import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Crie a window e defina o conteúdo inicial como a HomeView (SwiftUI)
        let window = UIWindow(windowScene: windowScene)
        let homeView = HomeView()
        window.rootViewController = UIHostingController(rootView: homeView)
        self.window = window
        window.makeKeyAndVisible()
    }
}
