//
//  UserDefaults+Services.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - UserDefaults + UserDefaultsService
//
extension UserDefaults: UserDefaultsService {
    
    /// Returns the Object (if any) associated with the specified UserDefaultsKeys.
    ///
    func object<T>(forKey key: UserDefaultsKeys) -> T? {
        return value(forKey: key.rawValue) as? T
    }
    
    /// Stores the UserDefaultsKeys/Value Pair.
    ///
    func set<T>(_ value: T?, forKey key: UserDefaultsKeys) {
        set(value, forKey: key.rawValue)
    }
    
    /// Remove any object associated with the specified UserDefaultsKeys.
    ///
    func removeObject(forKey key: UserDefaultsKeys) {
        removeObject(forKey: key.rawValue)
    }
    
    /// Indicates if there's an entry for the specified UserDefaultsKeys.
    ///
    func containsObject(forKey key: UserDefaultsKeys) -> Bool {
        return value(forKey: key.rawValue) != nil
    }
    
    /// Should be called when user attempt to sign-out.
    ///
    func purge() {
        let keys = UserDefaultsKeys.allCases
        keys.forEach {
            UserDefaults.standard.removeObject(forKey: $0)
        }
    }
}
