//
//  Coordinator.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

/// A basic `Coordinator` design pattern to help decouple things.
///
protocol Coordinator {
    
    /// Root navigation controller of the coordinator.
    ///
    var navigationController: UINavigationController { get }
    
    /// Starts job of the coordinator.
    ///
    func start()
}
