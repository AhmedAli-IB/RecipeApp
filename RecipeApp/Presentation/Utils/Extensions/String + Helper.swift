//
//  String + Helper.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import UIKit

extension String {
    
    func heightForWithFont(font: UIFont, width: CGFloat) -> CGFloat {
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: width,
                          height: CGFloat.greatestFiniteMagnitude)
        
        let label: UILabel = UILabel(frame: rect)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        
        label.sizeToFit()
        return label.frame.height
    }
}
