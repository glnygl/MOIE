//
//  EmptyStateView.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import UIKit

protocol EmptyStateDelegate: class {
    func refresh()
}

class EmptyStateView: BaseView {
    
    weak var delegate: EmptyStateDelegate?

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var text: String? {
        didSet {
            descriptionLabel.text = text
        }
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
        delegate?.refresh()
    }
    
    
}
