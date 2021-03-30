//
//  RealmStorageManager.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation
import RealmSwift
/// RealmStorageManager: Manages the entire Realm Stack. Conforms to the StorageManager API.
///
final class RealmStorageManager: StorageManagerType {
    
    /// Storage Identifier.
    //       let name: String
    
    /// Returns the Storage associated with the View Thread.
    let storage: StorageType
    
    /// Designated Initializer.
    init(realm: Realm? = RealmProvider.default) {
        // self.name = name
        self.storage = RealmStorage(realm: realm)
    }
    
    /// This method effectively destroys all of the stored data, and generates a blank Persistent Store from scratch.
    ///
    func reset() {
        do {
            try storage.reset()
            print("💣 [RealmStorageManager] Stack Destroyed!")
            NotificationCenter.default.post(name: .StorageManagerDidResetStorage, object: self)
        } catch {
            print("Unable to destroy [RealmStorageManager] with error: \(error)")
        }
        
    }
    
}
