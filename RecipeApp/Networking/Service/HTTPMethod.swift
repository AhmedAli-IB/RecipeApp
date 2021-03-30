//
//  HTTPMethod.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import Foundation

// MARK: - HTTPMethod
/// Will be used to set the HTTP method of our request.
///
//
public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}
