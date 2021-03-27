//
//  NetworkError.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import Foundation

// MARK: - NetworkError
/// Handle network faliure of request
///
public enum NetworkError: Error, Equatable {
    case serverError
    case noData
    case unableToDecode
    case clientError
    
    var description: String {
        switch self {
        case .serverError:
            return "Network Request failed, server not available."
        case .noData:
            return "Response returned with no data to decode."
        case .unableToDecode:
            return "We could not decode the response."
        case .clientError:
            return "failed to build request"
        }
    }
}
