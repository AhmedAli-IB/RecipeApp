//
//  DetailsTableViewHeader.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

// MARK: - DetailsTableViewHeader
//
class DetailsTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var headerTitleLabel: UILabel!
    
    // MARK: - Configure
    //
    func configureHeaderTitle(title: String?) {
        headerTitleLabel.text = title
    }
}
