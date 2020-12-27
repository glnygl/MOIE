//
//  MainViewModel.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

final class MainViewModel {
    
    var populerMoviesDoneHandler = {(response: PopularMovies?) -> () in }
    var populerMoviesErrorHandler = {(error: Error?) -> () in }
    
    func getPopulerMovies() {
        let request = PopularMoviesRequest()
        Service.shared.getPopularMovies(request: request) { [weak self] (response) in
            self?.populerMoviesDoneHandler(response)
        } errorHandler: { [weak self] (error) in
            self?.populerMoviesErrorHandler(error)
        }
    }
}
