//
//  FavoriteCoordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

// MARK: - FavoriteCoordinator
/// `FavoriteCoordinator` responsable for navigation logic in favorite list  flow
///
///
final class FavoriteCoordinator: Coordinator {
    
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
        showFavoriteViewController()
    }
    /// Show home flow
    ///
    private func showFavoriteViewController() {
        let favoriteVC = FavoriteViewController()
        self.navigationController.setViewControllers([favoriteVC], animated: false)
    }
}
