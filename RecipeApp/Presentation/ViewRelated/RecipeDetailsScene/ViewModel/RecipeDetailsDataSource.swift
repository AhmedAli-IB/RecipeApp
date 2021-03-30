//
//  RecipeDetailsDataSource.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

// MARK: - HomeDataSource
//
class RecipeDetailsDataSource: NSObject {
    
    // MARK: - Properties
    //
    private var sections: [Section] = []
    private var recipeDescription: String = ""
    private var recipeImage: String = ""
    private var ingredients: [String] = []
    
}

// MARK: - Configure View Data
//
extension RecipeDetailsDataSource {
    
    func setRecipeDescription(_ recipeDescription: String) {
        self.recipeDescription = recipeDescription
    }
    
    func setRecipeImage(_ recipeImage: String) {
        self.recipeImage = recipeImage
    }
    
    func setIngredients(_ ingredients: [String]) {
        self.ingredients = ingredients
    }
}

// MARK: - UITableViewDataSource conformance
//
extension RecipeDetailsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
}

// MARK: - UITableViewDataSource conformance helpers
//
extension RecipeDetailsDataSource {
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch cell {
        case let cell as ImageTableViewCell:
            configureImageCell(cell, at: indexPath)
        case let cell as DescriptionCell:
            configureDescriptionCell(cell, at: indexPath)
        case let cell as IngredientsTableViewCell:
            configureIngredientsCell(cell, at: indexPath)
        default:
            fatalError("Unexpected cell sent to \(#function)")
        }
    }
    /// Configure image cell
    ///
    func configureImageCell(_ cell: ImageTableViewCell, at indexPath: IndexPath) {
        cell.viewModel = recipeImage
    }
    /// Configure description cell
    ///
    func configureDescriptionCell(_ cell: DescriptionCell, at indexPath: IndexPath) {
        
        cell.viewModel = recipeDescription
    }
    
    /// Configure configure ingredients cell
    ///
    func configureIngredientsCell(_ cell: IngredientsTableViewCell, at indexPath: IndexPath) {
        cell.list = ingredients
    }
    
}

// MARK: - Reload Sections
//
extension RecipeDetailsDataSource {
    
    func reloadSections() {
        self.sections = {
            // Image section
            let imageSection: Section? = {
                let row = Row(reuseIdentifier: ImageTableViewCell.classNameWithoutNamespaces)
                return Section(title: nil,
                               headerHeight: .zero,
                               sectionHeight: CGFloat(Constants.imageRowHeight),
                               rows: [row])
            }()
            
            // description section
            let descriptionSection: Section? = {
                let row = Row(reuseIdentifier: DescriptionCell.classNameWithoutNamespaces)
                // estimated height based on description label
                let font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .medium)
                let width =  UIScreen.main.bounds.width - Constants.margin
                let estimatedHeight = recipeDescription.heightForWithFont(font: font,
                                                                          width: width) + Constants.margin
                
                return Section(title: SectionTitles.recipeDiscription,
                               headerHeight: Constants.headerHeight,
                               sectionHeight: estimatedHeight,
                               rows: [row])
            }()
            
            // ingredients section
            let ingredientsSection: Section? = {
                let row = Row(reuseIdentifier: IngredientsTableViewCell.classNameWithoutNamespaces)
                return Section(title: SectionTitles.ingredients,
                               headerHeight: Constants.headerHeight,
                               sectionHeight: CGFloat(CGFloat(ingredients.count / 2) * Constants.categoryRowHeight),
                               rows: [row])
            }()
            
            return [imageSection, descriptionSection, ingredientsSection].compactMap { $0 }
        }()
    }
    
}

// MARK: - UITableViewDelegate
//
extension RecipeDetailsDataSource {
    
    func viewForHeaderInSection(_ section: Int, in tableView: UITableView) -> UIView? {
        
        let header = tableView.dequeueHeaderFooter() as DetailsTableViewHeader
        header.configureHeaderTitle(title: sections[section].title)
        return header
    }
    
    func heightForHeaderInTableView(_ tableView: UITableView, section: Int) -> CGFloat {
        return sections[section].headerHeight
    }
    
    func heightForRowAtnTableView(_ tableView: UITableView, heightForRowAt section: Int) -> CGFloat {
        sections[section].sectionHeight
    }
}
// MARK: - Handle Sections
//
private extension RecipeDetailsDataSource {
    
    enum SectionTitles {
        static let recipeDiscription: String = "Description"
        static let ingredients: String = "Ingredients"
    }
    
    struct Section {
        let title: String?
        let headerHeight: CGFloat
        let sectionHeight: CGFloat
        let rows: [Row]
    }
    
    struct Row {
        let reuseIdentifier: String
    }
}
// MARK: - Constants
//
private extension RecipeDetailsDataSource {
    
    enum Constants {
        static let headerHeight = CGFloat(48)
        static let categoryRowHeight = CGFloat(44)
        static let descriptionRowHeight = CGFloat(100)
        static let imageRowHeight = CGFloat(350)
        static let headerFontSize = CGFloat(20)
        static let margin = CGFloat(20)
        static let fontSize = CGFloat(18)

    }
}
