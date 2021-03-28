//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

// MARK: - RecipeCell
//
class RecipeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var recipeNameLabel: UILabel!
    @IBOutlet private weak var recipeCarbosLabel: UILabel!
    @IBOutlet private weak var recipeCaloriesLabel: UILabel!
    
    // MARK: - Properties
    //
    var viewModel: RecipeCellRepresentable? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
}

// MARK: - Configuration
//
private extension RecipeCell {
    
    /// Configure  view
    ///
    func configureView() {
//        containerView.makeCardView()
        recipeImageView.layer.cornerRadius = Constants.imageCornerRadius
    }
    /// Configure cell with data from cell view model
    ///
    func configureCell() {
        recipeImageView.setImage(representable: viewModel)
        recipeNameLabel.text = viewModel?.recipeName
        recipeCarbosLabel.text = viewModel?.recipeCarbos
        recipeCaloriesLabel.text = viewModel?.recipeCalories
    }
}

// MARK: - Constants
//
private extension RecipeCell {
    
     enum Constants {
        static let imageCornerRadius = CGFloat(20)
    }
}
