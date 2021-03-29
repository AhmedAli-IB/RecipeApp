//
//  RecipeDetailsUseCase.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation

// MARK: - RecipeDetailsUseCase
//
protocol RecipeDetailsUseCaseType {
    func toggleFavorite(recipeID: String)
    func contains(recipeId: String) -> Bool
}

final class RecipeDetailsUseCase: RecipeDetailsUseCaseType {
    
    // MARK: - Properties
    //
    let storageManager: StorageManagerType
    
    init(storageManager: StorageManagerType = RealmStorageManager()) {
        self.storageManager = storageManager
    }
    
    // MARK: - Handlera
    //
    /// Add or Remove favorite based on exist of item in realm
    /// - Parameter recipeID: recipe id to favorite or un favorite
    ///
    func toggleFavorite(recipeID: String) {
        guard let itemCount =  checkItemIsExist(recipeID) else { return }
        itemCount > 0 ? removeFavorite(recipeID) : saveFavorite(recipeID)
    }
    
    /// Check this item exist in realm
    /// - Parameter recipeId: recipe id to favorite or un favorite
    /// - Returns: `true` if the element was found in the sequence; otherwise,
    ///   `false`.
    func contains(recipeId: String) -> Bool {
        guard let itemCount =  checkItemIsExist(recipeId) else {
            return false
        }
        return itemCount > 0
    }
}

// MARK: - Private handlers
//
private extension RecipeDetailsUseCase {
    
    /// Save item in realm
    ///
    func saveFavorite(_ recipeID: String) {
        let favorite = FavoriteModel(recipeID)
        try? storageManager.storage.insertNewObject(object: favorite)
    }
    /// Remove recipe from realm
    ///
    func removeFavorite(_ recipeID: String) {
        let userId = UserDefaults.standard.object(forKey: .credentials) ?? ""
        let query = "recipeId == '\(recipeID)' AND userID == '\(userId)'"
        let predicate = NSPredicate(format: query)
        
        let favoriteLocalObject = try? storageManager.storage.firstObject(ofType: FavoriteModel.self,
                                                                          matching: predicate)
        guard let favoriteObject = favoriteLocalObject else {
            return
        }
        try? storageManager.storage.deleteObject(favoriteObject)
    }
    /// Check item is exist in realm
    ///
    func checkItemIsExist(_ recipeID: String) -> Int? {
        let userId = UserDefaults.standard.object(forKey: .credentials) ?? ""
        let query = "recipeId == '\(recipeID)' AND userID == '\(userId)'"
        let predicate = NSPredicate(format: query)
        let count = try? storageManager.storage.countObjects(ofType: FavoriteModel.self, matching: predicate)
        return count
    }
}
