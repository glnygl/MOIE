//
//  MovieDetailViewController.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

final class MovieDetailViewController: BaseViewController {
    
    let viewModel = MovieDetailViewModel()
    @IBOutlet var movieDetailView:
        MovieDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie Detail"
        sycnViewModel()
    }
    
    func sycnViewModel() {
        viewModel.movieCastDoneHandler = { [weak self] response in
            if let actors = response?.cast {
                self?.movieDetailView.actors = actors
            }
        }
    }
}
