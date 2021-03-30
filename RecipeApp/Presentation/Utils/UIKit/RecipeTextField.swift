//
//  RecipeTextField.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

@IBDesignable
class RecipeTextField: UITextField {
    /// Callbacl when value change, used for `bind`
    ///
    private var didChangeValue: ((String?) -> Void)?
    
}

// MARK: - Data Binding
//
extension RecipeTextField {
    
    @discardableResult
    func bind(_ onValueUpdate: @escaping (String?) -> Void) -> RecipeTextField {
        configureBinding()
        self.didChangeValue = onValueUpdate
        return self
    }
    
    private func configureBinding() {
        addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    
    @objc
    private func textFieldEditingChanged(_ textField: UITextField) {
        didChangeValue?(textField.text)
    }
}
