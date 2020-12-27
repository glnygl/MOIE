//
//  MovieDetailViewModel.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

final class MovieDetailViewModel {
   
    var movie: Movie? {
        didSet {
            if let movieId = movie?.id {
                getCast(movieId: movieId)
            }
        }
    }
    
    var movieCastDoneHandler = {(response: Cast?) -> () in }
    var movieCastErrorHandler = {(error: Error?) -> () in }
    
    func getCast(movieId: Int) {
        let request = MovieCastRequest(movieId: movieId)
        Service.shared.getCast(request: request) { [weak self] (response) in
            self?.movieCastDoneHandler(response)
        } errorHandler: { [weak self] (error) in
            self?.movieCastErrorHandler(error)
        }
    }
    
}
