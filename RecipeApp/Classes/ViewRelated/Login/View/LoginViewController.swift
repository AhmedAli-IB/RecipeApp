//
//  LoginViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
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
        self.title = Strings.title
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
// MARK: - Strings
//
private extension LoginViewController {
    
    enum Strings {
        static let title = "LOGIN"
    }
}
