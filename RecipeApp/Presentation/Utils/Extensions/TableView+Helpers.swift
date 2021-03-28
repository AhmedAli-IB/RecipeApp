//
//  TableView+Helpers.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

// MARK: - UITableView + Helpers
//
extension UITableView {
    
    func registerCellNib<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nibName = reuseIdentifier ?? T.classNameWithoutNamespaces
        self.register(T.loadNib(), forCellReuseIdentifier: nibName)
    }
    
    /// Dequeue cell with generics
    func dequeue<T: UITableViewCell>(_: T.Type) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
        else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
}
