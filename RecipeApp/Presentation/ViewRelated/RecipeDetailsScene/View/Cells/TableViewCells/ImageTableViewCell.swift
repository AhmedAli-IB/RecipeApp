//
//  ImageTableViewCell.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var recipeImageView: UIImageView!
    
    // MARK: - Properties
    //
    var viewModel: String? {
        didSet {
            configureCell()
        }
    }
    
}
// MARK: - configurations
//
extension ImageTableViewCell {
    
    func configureCell() {
        recipeImageView.setImage(urlString: viewModel, placeholder: Asset.Assets.placeholder.image)
    }
}
