//
//  AuthCoordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//
import UIKit

// MARK: - AuthCoordinator
/// `AuthCoordinator` responsable for navigation logic in recipe list  flow
///
protocol AuthCoordinatorProtocol: class {
    func reloadLaunchInstructor()
}
// MARK: - RecipeListCoordinator
//
final class AuthCoordinator: Coordinator {
    
    // MARK: - Properties
    //
    var navigationController: UINavigationController
    var finishFlow: (() -> Void)?

    // MARK: - Init
    //
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    //
    func start() {
        showLoginViewController()
    }
    /// Show Login flow
    ///
    private func showLoginViewController() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        self.navigationController.setViewControllers([loginVC], animated: false)
    }
}

// MARK: - RecipeListCoordinator + RecipeListCoordinatorProtocol
//
extension AuthCoordinator: AuthCoordinatorProtocol {
    
    func reloadLaunchInstructor() {
        finishFlow?()
    }
}
