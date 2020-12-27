//
//  CustomFlowLayout.swift
//  MOIE
//
//  Created by glnygl on 27.12.2020.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    var cellSpacing: CGFloat = 0
    
    init(cellSpacing: CGFloat) {
        super.init()
        self.cellSpacing = cellSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.minimumLineSpacing = cellSpacing
        let attributes = super.layoutAttributesForElements(in: rect)
 
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}
