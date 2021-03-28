//
//  RecipeListCoordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

// MARK: - RecipeListCoordinator
/// `RecipeListCoordinator` responsable for navigation logic in recipe list  flow
///
protocol RecipeListCoordinatorProtocol: class {
    func pushDetailsViewController()
    func popViewController()
}
// MARK: - RecipeListCoordinator
//
final class RecipeListCoordinator: Coordinator {
    
    // MARK: - Properties
    //
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    //
    func start() {
        showRecipeListViewController()
    }
    /// Show recipe list  flow
    ///
    private func showRecipeListViewController() {
        let recipeListVC = RecipeListViewController()
        self.navigationController.setViewControllers([recipeListVC], animated: false)
    }
}

// MARK: - RecipeListCoordinator + RecipeListCoordinatorProtocol
//
extension RecipeListCoordinator: RecipeListCoordinatorProtocol {
    
    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    func pushDetailsViewController() {

    }
    
}
