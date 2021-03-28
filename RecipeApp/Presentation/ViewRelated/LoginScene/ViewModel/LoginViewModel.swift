//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - LoginViewModel
/// `LoginViewModel` responsible for
///

class LoginViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    let loginUseCase: LoginUseCaseType
    /// User  inputs  Password
    ///
    var password: String?
    
    var email: String?
    
    // MARK: - Callbacks
    
    /// Called when the operation succeed, API success
    ///
    var onSuccessLogin: (() -> Void)?
    
    // MARK: - Init
    //
    init(loginUseCase: LoginUseCaseType = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }

    // MARK: - Handlers
    
    /// Submit user data to start  login process
    ///
    func submit() {
        do {
            let validEmail = try validateEmail()
            let validPassword = try validatePassword()
            login(validEmail: validEmail, validPassword: validPassword)
        } catch {
            state.send(.failure(error.localizedDescription))
        }
    }
    /// Validate email.
    ///
    func validateEmail() throws -> String {
        
        let validEmail = try ValidatorFactory
            .validatorFor(type: .email)
            .validated(email)
        return validEmail
    }
    
    /// Validate password.
    ///
    func validatePassword() throws -> String {
        
        let validPassword = try ValidatorFactory
            .validatorFor(type: .password)
            .validated(password)
        return validPassword
        
    }
}

// MARK: - Private Handlers
//
private extension LoginViewModel {
    
    func login(validEmail: String, validPassword: String) {
        state.send(.loading)
        loginUseCase.execute(email: validEmail, password: validPassword) { [weak self] (result) in
            guard let self  = self else { return }
            switch result {
            case .success(let user):
                // save user to user defualts
                UserDefaults.standard.set(user.userID, forKey: .credentials)
                
                self.state.send(.success)
                self.onSuccessLogin?()
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
    
}
