//
//  ApplicationCoordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

// MARK: - ApplicationCoordinator
/// `ApplicationCoordinator` responsible for set launch screen that will apear in app
///
class ApplicationCoordinator {
    
    // MARK: - Properties
    //
    private weak var window: UIWindow?
    
    let tabBarController: MainTabBarController = MainTabBarController()

    var coordinator: Coordinator!
    
    // MARK: - init
    //
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        // run flow based of user credentials
        UserDefaults.standard.containsObject(forKey: .credentials) ? runHomeFlow() : runAuthFlow()
    }
}
// MARK: - Handlers
//
private extension ApplicationCoordinator {
        
    /// Run home  flow
    ///
    func runHomeFlow() {
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        let homeCoordinator = TabBarCoordinator(tabBarController: tabBarController)
        homeCoordinator.start()
    }
    
    /// Run Auth  flow
    ///
    func runAuthFlow() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.finishFlow = { [unowned self] in
            self.start()
        }
        authCoordinator.start()
    }
}
