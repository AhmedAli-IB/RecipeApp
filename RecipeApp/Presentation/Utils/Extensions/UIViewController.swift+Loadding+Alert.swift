//
//  UIViewController.swift+Loadding+Alert.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

// MARK: - Loading
//
extension BaseViewController {
    
    func shouldShowProgressView(_ show: Bool) {
        DispatchQueue.main.async {
            show ? self.showActivityIndicator() : self.hideActivityIndicator()
        }
    }
    /// Show activity Indicator
    ///
    func showActivityIndicator() {
        
        activityView.color = .black
        activityView.center = self.view.center
        activityView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(activityView)
        let xAnchor =  self.view.centerXAnchor
        let yAnchor =  self.view.centerYAnchor
    
        activityView.centerXAnchor.constraint(equalTo: xAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: yAnchor).isActive = true
        activityView.startAnimating()
        
    }
    /// Hide activity indicator
    ///
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}

// MARK: - Alert
//
extension UIViewController {
    
    typealias AlertHandler = ((UIAlertAction) -> Void)
    
    /// Show alert with multiple actions
    ///
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   actions: UIAlertAction?...,
                   completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions
            .compactMap { $0 }
            .forEach { alertVC.addAction($0) }
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: completion)
        }
    }
    
    /// Show basic Alert
    ///
    func showBasicAlert(message: String, handler: UIAlertAction? = nil) {
        let okAction = UIAlertAction(title: "OK", style: .default)
        showAlert(title: nil, message: message, actions: okAction, handler)
    }
}
