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
    func pushDetailsViewController(recipe: RecipeMainModel)
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
        recipeListVC.coordinator = self
        self.navigationController.setViewControllers([recipeListVC], animated: false)
    }
}

// MARK: - RecipeListCoordinator + RecipeListCoordinatorProtocol
//
extension RecipeListCoordinator: RecipeListCoordinatorProtocol {
    
    /// Pop view controller
    ///
    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    /// Go to recipe details view
    ///
    func pushDetailsViewController(recipe: RecipeMainModel) {
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        let recipeDetailsVC = RecipeDetailsViewController(viewModel: viewModel)
        recipeDetailsVC.coordinator = self
        self.navigationController.pushViewController(recipeDetailsVC, animated: true)
    }
    
}
