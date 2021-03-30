//
//  LoginUseCaseMock.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import Foundation
@testable import RecipeApp

// MARK: - LoginUseCaseMock
//
class LoginUseCaseMock: LoginUseCaseType {
    
    // MARK: - Propertes
    //
    var executeCalled = false
    var user: User = User(name: "ahmed", userID: "ahmedID")
    var completeClosure: ((Result<User, Error>) -> Void)?
    
    // MARK: - Handlers
    //
    func execute(email: String, password: String, onCompletion: @escaping (Result<User, Error>) -> Void) {
        executeCalled = true
        completeClosure = onCompletion
    }
    
    /// Test success case for login
    ///
    func testExcuteLogin_SuccessCase_ReturnTrue() {
        completeClosure?(.success(user))
    }
    
    /// Test faliure case for login
    ///
    func testExcuteLogin_FailureCase_FailedAndReturnError() {
        completeClosure?(.failure(NetworkError.clientError))
    }
    
}
