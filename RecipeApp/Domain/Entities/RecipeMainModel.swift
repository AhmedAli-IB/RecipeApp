//
//  Recipe.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - RecipeMainModel
//
struct RecipeMainModel: Codable {
    
    let id, fats, name, time: String?
    let image: String?
    let weeks: [String]?
    let carbos, fibers: String?
    let rating: Double?
    let country: String?
    let ratings: Int?
    let calories, headline: String?
    let keywords, products: [String]?
    let proteins: String?
    let favorites, difficulty: Int?
    let recipeMainModelDescription: String?
    let highlighted: Bool?
    let ingredients: [String]?
    let deliverableIngredients: [String]?

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country
        case ratings, calories, headline, keywords, products, proteins, favorites, difficulty
        case highlighted, ingredients
        case recipeMainModelDescription = "description"
        case deliverableIngredients = "deliverable_ingredients"
    }
}
