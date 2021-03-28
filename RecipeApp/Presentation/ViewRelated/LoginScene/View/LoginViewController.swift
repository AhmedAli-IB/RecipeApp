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
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Properties
    //
     var coordinator: AuthCoordinatorProtocol?
    
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}
// MARK: - Configurations
//
private extension LoginViewController {
    
    func configureAppearance() {
        configureView()
        configureLoginView()
        configureLoginButton()
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
// MARK: - IBActions
//
private extension LoginViewController {
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: .credentials)
        coordinator?.reloadLaunchInstructor()
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
