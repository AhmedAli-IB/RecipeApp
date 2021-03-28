//
//  UIView + Helpers.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import UIKit

extension UIView {
    
     func makeCardView() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = Constants.shadowRadius
        self.layer.cornerRadius = Constants.cornerRadius
    }
    
    /// Returns the Nib associated with the received: It's filename is expected to match the Class Name
    ///
    class func loadNib() -> UINib {
      return UINib(nibName: classNameWithoutNamespaces, bundle: nil)
    }
    // MARK: - Constant
    //
    private enum Constants {
        static let shadowOpacity = Float(0.5)
        static let cornerRadius = CGFloat(20)
        static let shadowRadius = CGFloat(10)
    }
}
