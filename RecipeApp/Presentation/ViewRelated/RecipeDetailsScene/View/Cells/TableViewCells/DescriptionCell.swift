//
//  DescriptionCell.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

class DescriptionCell: UITableViewCell {

    // MARK: - Outlets
    //
    @IBOutlet private weak var recipeDiscriptionLabel: UILabel!
    
    // MARK: - Properties
    //
    var viewModel: String? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
// MARK: - configurations
//
extension DescriptionCell {
    
    func configureCell() {
        recipeDiscriptionLabel.text = viewModel
    }
}
