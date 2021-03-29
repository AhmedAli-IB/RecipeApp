//
//  StorageType.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation
import RealmSwift

/// Defines all of the methods made available by the Storage.
///
 protocol StorageType: class {

    /// Returns all of the available objects of a given Type, matching the specified Predicate (and sorted with a given collection of
    /// SortDescriptors).
    ///
    func allObjects<T>(ofType type: T.Type, matching predicate: NSPredicate?) -> [T] where T: Object

    /// Returns the count of objects, of a given Type, matching a specified Predicate.
    ///
    func countObjects<T: Object>(ofType type: T.Type, matching predicate: NSPredicate?) throws -> Int

    /// Nukes the specified Object.
    ///
    func deleteObject<T: Object>(_ object: T) throws

    /// Inserts a new object of the given Type.
    ///
    func insertNewObject<T: Object>(object: T) throws
    
    /// Returns the first available object, of a given kind, matching the specified Predicate.
    ///
    func firstObject<T: Object>(ofType type: T.Type, matching predicate: NSPredicate?) throws -> T?

    /// Asynchronously performs a given block on the StorageType's queue.
    ///
    func perform(_ closure: @escaping () -> Void)
    
    /// Deletes all objects from the storage type.
    ///
    func reset() throws
 
}
