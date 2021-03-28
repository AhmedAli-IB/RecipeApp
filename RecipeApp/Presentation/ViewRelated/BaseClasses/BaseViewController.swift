//
//  BaseViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

// MARK: - Base View Controller
//
class BaseViewController: UIViewController {
    
    // MARK: - Properties
    //
     let activityView = UIActivityIndicatorView(style: .large)
    
    // MARK: - ViewModel + State Binding Helpers

    @discardableResult
    func bindLoadingState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            self?.shouldShowProgressView(state == .loading)
        }
    }
    
    @discardableResult
    func bindErrorState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            if case .failure(let error) = state {
                self?.showBasicAlert(message: error)
            }
        }
    }
    
    /// Dismiss Views
    ///
    func endEditting() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
