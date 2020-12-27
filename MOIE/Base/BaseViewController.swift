//
//  BaseViewController.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appGray, NSAttributedString.Key.font : Fonts.blackFont(size: 16)]
        navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "chevron.left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "favorite")
        self.navigationController?.navigationBar.tintColor = UIColor.appGray
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}
