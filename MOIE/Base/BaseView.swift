//
//  BaseView.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

class BaseView: UIView {
    
    var contentView: UIView?
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeXib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeXib()
        setupView()
    }
    
    private func initializeXib() {
        guard let view = loadViewFromNib() else { return }
        addSubview(view)
        contentView = view
    }
    
    func setupView() {}
    
}
