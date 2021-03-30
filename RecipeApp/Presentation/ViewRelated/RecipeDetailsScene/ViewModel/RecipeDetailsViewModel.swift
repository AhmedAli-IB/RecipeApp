//
//  RecipeDetailsViewModel.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation

// MARK: - RecipeDetailsViewModel
//
class RecipeDetailsViewModel: BaseViewModel {
    
    // MARK: - Callbacks
    /// Called when data is updated and reload is needed.
    ///
    private var setReloadNeeded: (() -> Void)?
    
    // MARK: - Properties
    //
    private let recipe: RecipeMainModel
    private let useCase: RecipeDetailsUseCaseType
    
    /// RecipeDetailsDataSource
    //
    var dataSource: RecipeDetailsDataSource = {
        return RecipeDetailsDataSource()
    }()
    /// Recipe name
    ///
    var recipeName: String {
        recipe.recipeName
    }
    /// Check item is favorite
    //
    var isFavorite: Bool {
        guard let recipeId = recipe.id else {
            return false
        }
       return useCase.contains(recipeId: recipeId)
    }
    
    // MARK: - Init
    //
    init(recipe: RecipeMainModel, useCase: RecipeDetailsUseCaseType = RecipeDetailsUseCase()) {
        self.recipe = recipe
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        configureDataSource()
    }
    
    func toggleFavorite() {
        guard let recipeId = recipe.id else {
            return
        }
        useCase.toggleFavorite(recipeID: recipeId)
    }

}
// MARK: - Helpers
//
extension RecipeDetailsViewModel {
    
    func configureOnReload(onReload: @escaping (() -> Void)) {
        self.setReloadNeeded = onReload
    }
}

// MARK: - Private Handlers
//
private extension RecipeDetailsViewModel {
    
    func configureDataSource() {
        dataSource.setIngredients(recipe.ingredients ?? [])
        dataSource.setRecipeImage(recipe.image ?? "")
        dataSource.setRecipeDescription(recipe.recipeMainModelDescription ?? "")
        self.setReloadNeeded?()
    }
}
