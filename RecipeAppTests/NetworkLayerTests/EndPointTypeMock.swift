//
//  EndPointTypeMock.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import Foundation
@testable import RecipeApp

// MARK: - HttpbinEndPoint
//
enum EndPointTypeMock {
    case testGetHttpMethod
    case testFailureServerError
    case testClientError
    
}

extension EndPointTypeMock: EndPointType {
    
    var baseURL: URL {
        switch self {
        case .testClientError:
            guard let url = URL(string: "https://unspcifiedRequest") else {
                fatalError("baseURL could not be configured.")
            }
            return url
        default:
            guard let url = URL(string: "https://api.npoint.io/") else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
        
    }
    
    var path: String {
        switch self {
        
        case .testGetHttpMethod:
            return "43427003d33f1f6b51cc"
        case .testFailureServerError:
            return "/get/404"
        case .testClientError:
            return "/unspcifiedRequest"
        }
        
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .testGetHttpMethod:
            return .request
        case .testFailureServerError:
            return .request
        case .testClientError:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
