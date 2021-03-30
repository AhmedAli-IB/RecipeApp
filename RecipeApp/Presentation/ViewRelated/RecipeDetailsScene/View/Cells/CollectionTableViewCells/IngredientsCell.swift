//
//  IngredientsCell.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

class IngredientsCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var ingredientTitleLabel: UILabel!
    
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = Constants.containerViewCornerRadius
        }
    }
    
    // MARK: - Properties
    
    var viewModel: String? {
        didSet {
            configureCell()
        }
    }
}
// MARK: - configurations
//
extension IngredientsCell {
    
    func configureCell() {
        ingredientTitleLabel.text = viewModel
    }
}

// MARK: - Constants
//
private extension IngredientsCell {
    
    enum Constants {
        static let containerViewCornerRadius = CGFloat(20)
    }
}
