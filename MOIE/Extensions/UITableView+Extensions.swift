//
//  UITableView+Extensions.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation
import UIKit

extension UITableView {
   
    func register(types : [CellType]) {
        types.forEach { (type) in
            let nib = UINib(nibName: type.rawValue, bundle: nil)
            self.register(nib, forCellReuseIdentifier: type.rawValue)
        }
    }
    
    func dequeue<T : UITableViewCell>(type : String, indexPath : IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type, for: indexPath) as! T
    }
    
}
