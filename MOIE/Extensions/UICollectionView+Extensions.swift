//
//  UICollectionView+Extensions.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

extension UICollectionView {
    
    func register(types : [CellType]) {
        types.forEach({ (type) in
            let nib = UINib(nibName: type.rawValue, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: type.rawValue)
        })
    }
    
    func dequeue<T : UICollectionViewCell>(type : String, indexPath : IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type, for: indexPath) as! T
    }
}
