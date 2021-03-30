//
//  UserDefaults.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

protocol UserDefaultsService {
  
  /// Returns the Object (if any) associated with the specified UserDefaultsKeys.
  ///
  func object<T>(forKey key: UserDefaultsKeys) -> T?
  
  /// Stores the UserDefaultsKeys/Value Pair.
  ///
  func set<T>(_ value: T?, forKey key: UserDefaultsKeys)
      
  /// Remove any object associated with the specified UserDefaultsKeys.
  ///
  func removeObject(forKey key: UserDefaultsKeys)
  
  /// Indicates if there's an entry for the specified UserDefaultsKeys.
  ///
  func containsObject(forKey key: UserDefaultsKeys) -> Bool
  
  /// Remove all un-excludedCases of `UserDefaultsKeys`.
  /// Should be called when user attempt to sign-out.
  ///
  func purge()
  
}
