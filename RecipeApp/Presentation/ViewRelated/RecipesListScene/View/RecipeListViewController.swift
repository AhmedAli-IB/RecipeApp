//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 27/03/2021.
//

import UIKit

class RecipeListViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    //
    let viewModel = RecipeListViewModel()
    var coordinator: RecipeListCoordinator?
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        viewModel.viewDidLoad()
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
//
extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(RecipeCell.self)
        cell.viewModel = viewModel.getCurrentObject(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.getCurrentObject(for: indexPath)
        coordinator?.pushDetailsViewController(recipe: recipe)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
}

// MARK: - Configuration
//
private extension RecipeListViewController {
    
    /// Configure appearance
    ///
    func configureAppearance() {
        configureView()
        configureViewModel()
        registerCells()
        configureTableView()
    }
    /// Configure view
    ///
    func configureView() {
        title = Strings.title
        navigationController?.navigationBar.prefersLargeTitles = true
        let attribute  = [NSAttributedString.Key.foregroundColor: Asset.ColorPalette.primaryColor.color]
        self.navigationController?.navigationBar.titleTextAttributes = attribute
        self.navigationController?.navigationBar.largeTitleTextAttributes = attribute
        let logoutBarButtonItem = UIBarButtonItem(title: Strings.logout,
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(logoutUser))
        logoutBarButtonItem.tintColor = Asset.ColorPalette.primaryColor.color
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    /// Configure table view
    ///
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    /// Configure view model
    ///
    func configureViewModel() {
        bindErrorState(to: viewModel)
        bindLoadingState(to: viewModel)
        viewModel.onReloadNeeded = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    /// Register cells
    ///
    func registerCells() {
        tableView.registerCellNib(RecipeCell.self)
    }
}

// MARK: - Private Handlers
//
private extension RecipeListViewController {
    
    @objc
     func logoutUser() {
        viewModel.logout()
        coordinator?.logout()
    }
}
// MARK: - Constants
//
private extension RecipeListViewController {
    
     enum Constants {
        static let rowHeight = CGFloat(220)
    }
}

// MARK: - Strings
//
private extension RecipeListViewController {
    
    enum Strings {
        static let title = "Recipes"
        static let logout = "Logout"
    }
}
