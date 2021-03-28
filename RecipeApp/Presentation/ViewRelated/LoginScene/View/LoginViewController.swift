//
//  LoginViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - Outlets
    //
    @IBOutlet private weak var loginContainerView: UIView!
    @IBOutlet private weak var emailTextField: RecipeTextField!
    @IBOutlet private weak var passwordTextField: RecipeTextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Properties
    //
     var coordinator: AuthCoordinatorProtocol?
     private let viewModel: LoginViewModel = LoginViewModel()
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureViewModel()
    }
}

// MARK: - IBActions
//
private extension LoginViewController {
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        viewModel.submit()
    }
}

// MARK: - Configurations
//
private extension LoginViewController {
    /// Configure appearance
    ///
    func configureAppearance() {
        configureView()
        configureLoginView()
        configureLoginButton()
    }
    /// Configure view model
    ///
    func configureViewModel() {
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        configureOnPasswordChange()
        configureOnEmailChange()
        configureSuccessLogin()
    }
    /// Configure super view
    ///
    func configureView() {
        title = Strings.title
    }
    /// Configure login view
    ///
    func configureLoginView() {
        loginContainerView.makeCardView()
    }
    /// Configure login button
    ///
    func configureLoginButton() {
        loginButton.layer.cornerRadius = Constants.loginButtonCornerRadius
    }
}

// MARK: - Configure View Model
//
private extension LoginViewController {
    
    func configureOnPasswordChange() {
        passwordTextField.bind { [weak self] value in
            self?.viewModel.password = value
        }
    }
    
    func configureOnEmailChange() {
        emailTextField.bind { [weak self] value in
            self?.viewModel.email = value
        }
    }
    
    func configureSuccessLogin() {
        viewModel.onSuccessLogin = { [weak self] in
            self?.coordinator?.reloadLaunchInstructor()
        }
    }
}

private extension LoginViewController {
    enum Constants {
        static let loginButtonCornerRadius = CGFloat(20)
    }
}
// MARK: - Strings
//
private extension LoginViewController {
    
    enum Strings {
        static let title = "LOGIN"
    }
}
