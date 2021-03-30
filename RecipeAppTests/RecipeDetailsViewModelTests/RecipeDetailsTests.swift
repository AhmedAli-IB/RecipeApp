//
//  RecipeDetailsTests.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import Foundation
import RealmSwift
import XCTest
@testable import RecipeApp

// MARK: - RecipeDetailsTests
//
class RecipeDetailsTests: XCTestCase {
    
    // MARK: - Properties
    //
    var sut: RecipeDetailsViewModel!
    var recipeUseCase: RecipeDetailsUseCase!
//    var favoriteModel: FavoriteModel!
    var recipe: RecipeMainModel!
    var realm: Realm?
    var realmStorageManager: RealmStorageManager!

    // MARK: - Lifecycle
    //
    override func setUp() {
        super.setUp()
//        favoriteModel = FavoriteModel("recipeId")
        recipe = RecipeMainModel(id: "recipeId",
                                 fats: "",
                                 name: "",
                                 time: "",
                                 image: "",
                                 weeks: [],
                                 carbos: "",
                                 fibers: "",
                                 rating: 0.0,
                                 country: "",
                                 ratings: 0,
                                 calories: "",
                                 headline: "",
                                 keywords: [],
                                 products: [],
                                 proteins: "",
                                 favorites: 0,
                                 difficulty: 0,
                                 recipeMainModelDescription: "",
                                 highlighted: true,
                                 ingredients: [],
                                 deliverableIngredients: [])
        /// In memory saving 🤝
        ///
        realm = try? Realm(configuration: Realm.Configuration(inMemoryIdentifier: NSUUID().uuidString))
        realmStorageManager = RealmStorageManager(realm: realm)
        recipeUseCase = RecipeDetailsUseCase(storageManager: realmStorageManager)
        
        sut = RecipeDetailsViewModel(recipe: recipe, useCase: recipeUseCase)
    }
    
    override func tearDown() {
        sut = nil
        recipeUseCase = nil
        super.tearDown()
    }
    
    /// test is favorite recipe and expected is already saved in realm
    /// Save object first via toogle method and check
    ///
    func testIsFavoriteRecipe_FavoriteSavedInRealm_ReturnTrue() {
        
        // When
        sut.toggleFavorite()

        // Then
        let result =  recipeUseCase.contains(recipeId: recipe.id ?? "")
        XCTAssertTrue(sut.isFavorite)
        XCTAssertEqual(result, sut.isFavorite)

    }
    
    /// test is favorite recipe and expected is already saved in realm
    /// delete  object first via call toogle  method twoic  and check
    ///
    func testRemoveFavorite_FavoriteRemoveFromRealm_ReturnTrue() {
        
        // When
        sut.toggleFavorite()
        sut.toggleFavorite()
//
        // Then
        XCTAssertFalse(sut.isFavorite)

    }

}
