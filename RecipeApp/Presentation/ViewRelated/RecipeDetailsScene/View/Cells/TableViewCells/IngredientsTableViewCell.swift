//
//  IngredientsTableViewCell.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    //
    
    var list: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
}
// MARK: - Configure View
//

private extension IngredientsTableViewCell {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.allowsSelection = true
        collectionView.registerCellNib(IngredientsCell.self)
    }
}

// MARK: - UICollectionViewDataSource
//
extension IngredientsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count / 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(at: indexPath) as IngredientsCell
        configureIngredientCell(cell, at: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDataSource Conformance
//
extension IngredientsTableViewCell {
    
    func configureIngredientCell(_ cell: IngredientsCell, at indexPath: IndexPath) {
        let item = list[indexPath.row]
        cell.viewModel = item
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
//
extension IngredientsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.2, height: Constants.rowHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.horizontalSpace
    }
    
}

// MARK: - Constantss
//
private extension IngredientsTableViewCell {

    enum Constants {
        static let horizontalSpace = CGFloat(12)
        static let rowHeight = CGFloat(60)
    }
}
