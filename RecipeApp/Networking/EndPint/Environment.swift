//
//  Environment.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import Foundation

// MARK: - Environment
/// `Environment` responsible for build root url based on value in info.plist
///
enum Environment {
    
    // Plist Keys
    //
    enum PlistKeys {
        static let rootURL = "SERVER_URL"
    }
    
    // Plist Dictionary
    //
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // Server URL
    //
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[PlistKeys.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment \(#function)")
        }
        let baseUrl = "https://\(rootURLstring)"
        guard let url = URL(string: baseUrl ) else {
            fatalError("Root URL is invalid")
        }
        print("url version", url.absoluteString )
        return url
    }()
}
