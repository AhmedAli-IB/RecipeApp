//
//  TabBarCoordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//
import UIKit

// MARK: - TabBarCoordinator
//
final class TabBarCoordinator {
    
    // MARK: - Properties
    //
    private let tabBarController: MainTabBarController?

    // MARK: - Controllers
    // Recipe list view controller
    //
    private lazy var recipeListViewController: UIViewController = {
        let navigationController = UINavigationController()
        RecipeListCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.recipeTabIcon.image, tag: 0)
        
        tabBarItem.setImageOnly()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    // Favorite view controller
    //
    private lazy var favoriteViewController: UIViewController = {
        
        let navigationController = UINavigationController()
        FavoriteCoordinator(navigationController: navigationController).start()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: Asset.Assets.favoriteTabIcon.image, tag: 0)
        
        tabBarItem.setImageOnly()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    // MARK: - Init
    //
    init(tabBarController: MainTabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        /// Set Controllers to tab bar
        ///
        tabBarController?.viewControllers = {
            var controllers = tabBarController?.viewControllers ?? []
            
            let recipeListTabIndex = AppTab.home.visibleIndex()
            controllers.insert(recipeListViewController, at: recipeListTabIndex)
            
            let favoriteIndex = AppTab.favorite.visibleIndex()
            controllers.insert(favoriteViewController, at: favoriteIndex)
            
            return controllers
        }()
    }
}
