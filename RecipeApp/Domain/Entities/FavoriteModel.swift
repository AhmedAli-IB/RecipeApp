//
//  FavoriteModel.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation
import RealmSwift

@objcMembers
class FavoriteModel: Object {
    
     dynamic var favoriteID = NSUUID().uuidString
     dynamic var userID: String = UserDefaults.standard.object(forKey: .credentials) ?? ""
     dynamic var recipeId = ""
    
    // MARK: - Init
    //
    convenience init(_ recipeId: String) {
        self.init()
        self.recipeId = recipeId
    }
    
}
