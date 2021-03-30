//
//  RecipeListUseCaseMock.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import Foundation
@testable import RecipeApp

// MARK: - RecipeListUseCaseMock
//
class RecipeListUseCaseMock: RecipeUseCaseType {

    // MARK: - Propertes
    //
    var executeCalled = false
    var recipes: [RecipeMainModel] = []
    var completeClosure: ((Result<[RecipeMainModel], Error>) -> Void)?
    
    // MARK: - Handlers
    //
    func execute(onCompletion: @escaping (Result<[RecipeMainModel], Error>) -> Void) {
        executeCalled = true
        completeClosure = onCompletion
    }
    
    /// Test success case for receive list of recipes
    ///
    func testExcuteRecipeList_SuccessCase_ReturnTrue() {
        completeClosure?(.success(recipes))
    }
    
    /// Test faliure case for receive list of recipes
    ///
    func testExcuteRecipeList_FailureCase_FailedAndReturnError() {
        completeClosure?(.failure(NetworkError.clientError))
    }
    
}
