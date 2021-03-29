//
//  StorageManagerType.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation

// MARK: - StorageManagerType Notifications
//
extension NSNotification.Name {
    static let StorageManagerDidResetStorage = NSNotification.Name(rawValue: "StorageManagerDidResetStorage")
}

/// Defines the methods and properties implemented by any concrete StorageManager implementation.
///
protocol StorageManagerType {
    var storage: StorageType { get }
    func reset()
}
