//
//  MainViewController.swift
//  MOIE
//
//  Created by glnygl on 23.12.2020.
//

import UIKit

final class MainViewController: BaseViewController {
    
    let viewModel = MainViewModel()
    @IBOutlet var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sycnViewModel()
        mainView.delegate = self
        mainView.startIndicator()
        viewModel.getPopulerMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func sycnViewModel() {
        viewModel.populerMoviesDoneHandler = { [weak self] response in
            if let movies = response?.results, movies.count > 0 {
                self?.mainView.movies = movies
            } else {
                self?.mainView.showError(errorString: LocalizableStrings.States.emptyState)
            }
            self?.mainView.stopIndicator()
        }
        
        viewModel.populerMoviesErrorHandler = { [weak self] result in
            self?.mainView.stopIndicator()
            self?.mainView.showError(errorString: LocalizableStrings.States.errorState)
        }
    }
}

extension MainViewController: MainViewDelegate {
    func refreshData() {
        viewModel.getPopulerMovies()
    }
}
