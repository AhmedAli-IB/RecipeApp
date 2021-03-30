//
//  BaseVeiwModel.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import Foundation

// MARK: - Base View Model
//
class BaseViewModel {

    typealias Element = Any

    /// State
    var state = PublishSubject<State<Element>>()

}
