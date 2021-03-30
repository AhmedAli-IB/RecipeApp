//
//  RecipeEndPoint.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import Foundation

// MARK: - RecipeEndPoint
/// `RecipeEndPoint` include all api's related to recipes
///
enum RecipeEndPoint {
    case getRecipes
}

// MARK: - EndPointType
/// `RecipeEndPoint `Conform to EndPointType
///
extension RecipeEndPoint: EndPointType {
    
    var baseURL: URL {
        return Environment.rootURL
    }
    
    var path: String {
        
        switch self {
        case .getRecipes:
            return "43427003d33f1f6b51cc"
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    var task: HTTPTask {
        
        switch self {
        case .getRecipes:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
