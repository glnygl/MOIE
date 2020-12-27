//
//  UILabel+Extensions.swift
//  MOIE
//
//  Created by glnygl on 27.12.2020.
//

import UIKit

extension UILabel {
    func changeTextFont(text: String, font: UIFont){
        let attributedString = self.attributedText?.mutableCopy() as! NSMutableAttributedString
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: (attributedString.string as NSString).range(of: text))
        self.attributedText = attributedString
    }
}
