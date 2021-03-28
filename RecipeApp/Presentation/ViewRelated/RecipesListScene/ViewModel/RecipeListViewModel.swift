//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - RecipeListViewModel
//
class  RecipeListViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    let recipeUseCase: RecipeUseCaseType
    private var recipes: [RecipeMainModel] = []
    
    // MARK: - Callbacks
    //
    var onReloadNeeded: (() -> Void)?
    
    // MARK: - Init
    //
    init(recipeUseCase: RecipeUseCaseType = RecipeUseCase()) {
        self.recipeUseCase = recipeUseCase
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        loadRecipes()
    }
    /// number of rows
    ///
    var numberOfRows: Int {
        return recipes.count
    }
    /// Get current object based on index path
    ///
    func getCurrentObject(for indexPath: IndexPath) -> RecipeMainModel {
        return recipes[indexPath.row]
    }
}

// MARK: - Private Handlers
//
extension RecipeListViewModel {
    
    func loadRecipes() {
        state.send(.loading)
        recipeUseCase.execute { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recipes):
                self.state.send(.success)
                self.recipes = recipes
                self.onReloadNeeded?()
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
}
