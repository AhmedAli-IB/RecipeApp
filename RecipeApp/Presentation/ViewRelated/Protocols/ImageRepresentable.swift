//
//  ImageRepresentable.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

// MARK: - ImageRepresentable
//
protocol ImageRepresentable {
    var imageURL: String? { get }
    var placeholderImage: UIImage? { get }
}
