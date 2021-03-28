//
//  LoginUseCase.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - LoginUseCaseType
//
protocol LoginUseCaseType {
    func execute(email: String, password: String, onCompletion: @escaping (Result<User, Error>) -> Void)
}

final class LoginUseCase: LoginUseCaseType {
    
    /// Execute login request wirh valid email and password
    /// - Parameters:
    ///   - email: user email input
    ///   - password: user password input
    ///   - onCompletion: On success return with user object OR on failure return with error
    ///
    func execute(email: String, password: String, onCompletion: @escaping (Result<User, Error>) -> Void) {
        let loginResult = configureUsers(email: email, password: password)
        switch loginResult {
        case .success(let user):
            onCompletion(.success(user))
        case .failure(let error):
            onCompletion(.failure(error))
        }
    }
}
 // MARK: - Private Handlers
//
private extension LoginUseCase {
    
    /// Configure Users
    /// Responsible for create a hardcoded  users
    ///
    func configureUsers(email: String, password: String ) -> Result<User, Error> {
        
        let userOne = User(name: "ahmed", userID: "ahmedID")
        let userTwo = User(name: "ali", userID: "aliID")

        switch (email, password) {
        case ("ahmed@gmail.com", "12345678"): return .success(userOne)
        case ("ali@gmail.com", "87654321"): return .success(userTwo)
        default: return .failure(LoginError.invalidCredentials)
        }
    }
    enum LoginError: LocalizedError {
        
        case invalidCredentials
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
              return  "Please enter a valid credentials"
            }
        }
    }

}
