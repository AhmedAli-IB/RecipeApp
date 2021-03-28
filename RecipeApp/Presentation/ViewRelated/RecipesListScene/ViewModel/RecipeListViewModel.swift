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
    
    // MARK: - Init
    //
    init(recipeUseCase: RecipeUseCaseType = RecipeUseCase()) {
        self.recipeUseCase = recipeUseCase
    }
    
    // MARK: - Handlers
    //
    func loadRecipes() {
        state.send(.loading)
        recipeUseCase.execute { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recipes):
                self.state.send(.success)
                print("recipes==\(recipes)")
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
}
