//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

class RecipeDetailsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var recipeNameLabel: UILabel!
    // MARK: - Properties
    //
    var viewModel: RecipeDetailsViewModel!
    weak var coordinator: RecipeListCoordinatorProtocol?
    // MARK: - init
    //
    required init(viewModel: RecipeDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        viewModel.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - IBActions
//
private extension RecipeDetailsViewController {
    @IBAction func backButtonTapped(_ sender: Any) {
        coordinator?.popViewController()
    }

    @IBAction func favoriteButtonTapped(_ sender: Any) {
        viewModel.toggleFavorite()
        toggleFavoriteIcon()
    }
}
// MARK: - Configuration
//
private extension RecipeDetailsViewController {
    
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
        navigationController?.setNavigationBarHidden(true, animated: true)
        recipeNameLabel.text = viewModel.recipeName
        toggleFavoriteIcon()
    }
    /// Configure table view
    ///
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = viewModel.dataSource
        registerCells()
        registerHeaders(in: tableView)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: Constants.topInsetsMargin, left: 0, bottom: 0, right: 0)
    }
    /// Reload sections and data
    ///
    func reloadSectionsAndData() {
        viewModel.dataSource.reloadSections()
        tableView.reloadData()
    }
    /// Register cells
    ///
    func registerCells() {
        let cells = [
            ImageTableViewCell.self,
            DescriptionCell.self,
            IngredientsTableViewCell.self
        ]
        
        cells.forEach { cell in
            tableView.register(cell.loadNib(), forCellReuseIdentifier: cell.classNameWithoutNamespaces)
        }
    }
    /// Register headers
    ///
    func registerHeaders(in tableView: UITableView) {
        tableView.register(DetailsTableViewHeader.loadNib(),
                           forHeaderFooterViewReuseIdentifier: DetailsTableViewHeader.classNameWithoutNamespaces)
    }
    /// Set favorite image
    ///
    func makeButtonFavorite() {
        favoriteButton.setImage(Asset.Assets.favoriteIcon.image, for: .normal)
    }
    /// Setun favorite image
    ///
    func makeButtonUnfavorite() {
        favoriteButton.setImage(Asset.Assets.unfavoriteIcons.image, for: .normal)
    }
    /// Toggle favorite icon
    ///
    func toggleFavoriteIcon() {
       viewModel.isFavorite ? makeButtonFavorite() : makeButtonUnfavorite()
   }
}

// MARK: - Configuration
//
private extension RecipeDetailsViewController {
    
    func configureViewModel() {
        viewModel.configureOnReload { [weak self] in
            self?.reloadSectionsAndData()
        }
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
    }
}

// MARK: - UITableViewDelegate conformance
//
extension RecipeDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.dataSource.heightForRowAtnTableView(tableView, heightForRowAt: indexPath.section)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.dataSource.viewForHeaderInSection(section, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.dataSource.heightForHeaderInTableView(tableView, section: section)
    }
}

// MARK: - Constants
//
extension RecipeDetailsViewController {
    
    enum Constants {
        static let topInsetsMargin = CGFloat(-35)
    }
}
