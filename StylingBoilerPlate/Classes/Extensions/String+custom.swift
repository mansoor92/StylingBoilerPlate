//
//  String+custom.swift
//  Pods
//
//  Created by Incubasys on 14/09/2017.
//
//

import Foundation

extension String{
    public static  func boldAttributedString(boldComponent: String, otherComponent: String, boldFont: UIFont, otherfont: UIFont, textColor: UIColor) -> NSAttributedString {
        
        let boldAttrs = [NSFontAttributeName: boldFont, NSForegroundColorAttributeName: textColor]
        let boldAttributedString = NSAttributedString(string:"\(boldComponent) ", attributes: boldAttrs)
        
        let otherAttrs = [NSFontAttributeName: otherfont, NSForegroundColorAttributeName: textColor]
        let otherAttributedString = NSAttributedString(string:"\(otherComponent)", attributes: otherAttrs)
        
        let finalAttributedString = NSMutableAttributedString(attributedString: boldAttributedString)
        finalAttributedString.append(otherAttributedString)
        
        return finalAttributedString
    }
}
