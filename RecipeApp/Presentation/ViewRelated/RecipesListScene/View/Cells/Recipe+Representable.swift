//
//  Recipe+Representable.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

/// `RecipeMainModel` responsible for configure view
///
extension RecipeMainModel: RecipeCellRepresentable {
    
    var recipeName: String {
        return name ?? ""
    }
    
    var recipeCalories: String {
        return "\(calories ?? "")"
    }
    
    var recipeCarbos: String {
        return "\(carbos ?? "")"
    }
    
    var imageURL: String? {
        return image
    }
    
    var placeholderImage: UIImage? {
        return Asset.Assets.placeholder.image
    }
    
}
