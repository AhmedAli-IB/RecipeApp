//
//  RecipeCellRepresentable.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation
// MARK: - FavoriteCellRepresentable
//
protocol RecipeCellRepresentable: ImageRepresentable {
    var recipeName: String { get }
    var recipeCalories: String { get }
    var recipeCarbos: String { get }
}
