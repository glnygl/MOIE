//
//  Fonts.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import UIKit

class Fonts: UIFont {
    static let font = UIFont()
    
    static func blackFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Black", size: size)!
    }
    static func bookFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Book", size: size)!
    }
    static func romanFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Roman", size: size)!
    }
    static func heavyFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Heavy", size: size)!
    }
    static func mediumFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Medium", size: size)!
    }
    
}
