//
//  UIView+Extentions.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

extension UIView {

    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName , bundle: bundle)
        
        let cview = nib.instantiate(withOwner: self, options: nil).first as? UIView
        cview?.frame = self.bounds
        cview?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return cview
    }
    
    func giveShadow() {
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func giveBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
}
