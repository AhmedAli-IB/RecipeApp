//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

class RecipeListViewController: BaseViewController {
    
    // MARK: - Properties
    //
    let viewModel = RecipeListViewModel()
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        bindErrorState(to: viewModel)
        bindLoadingState(to: viewModel)
        viewModel.loadRecipes()
    }
}
