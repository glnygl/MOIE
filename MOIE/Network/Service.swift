//
//  Service.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation
import RxSwift

typealias PopulerMoviesDoneHandler = (PopularMovies?) -> ()
typealias PopulerMoviesErrorHandler = (Error?) -> ()
typealias MovieCastDoneHandler = (Cast?) -> ()
typealias MovieCastErrorHandler = (Error?) -> ()
typealias PersonDetailDoneHandler = (Person?) -> ()
typealias PersonDetailErrorHandler = (Error?) -> ()
typealias MovieCreditsDoneHandler = ([Credit]?) -> ()
typealias MovieCreditsErrorHandler = (Error?) -> ()

class Service {
    
    static let shared = Service()
    
    let disposeBag = DisposeBag()
    
    func getPopularMovies(request: PopularMoviesRequest, successHandler: @escaping PopulerMoviesDoneHandler, errorHandler: @escaping PopulerMoviesErrorHandler) {
        guard let request = request.asURLRequest() else { return }
        GenericService.getModel(urlRequest: request) { (result: PopularMovies?) in
            successHandler(result)
        } errorHandler: { (error) in
            errorHandler(error)
        }        
    }
    
    func getCast(request: MovieCastRequest, successHandler: @escaping MovieCastDoneHandler, errorHandler: @escaping MovieCastErrorHandler) {
        guard let request = request.asURLRequest() else { return }
        GenericService.getModel(urlRequest: request) { (result: Cast?) in
            successHandler(result)
        } errorHandler: { (error) in
            errorHandler(error)
        }
    }
    
    func getPersonDetail(request: PersonDetailRequest, successHandler: @escaping PersonDetailDoneHandler, errorHandler: @escaping PersonDetailErrorHandler) {
        guard let request = request.asURLRequest() else { return }
        GenericService.getModel(urlRequest: request) { (result: Person?) in
            successHandler(result)
        } errorHandler: { (error) in
            errorHandler(error)
        }
    }
    
    func getCredits(request: MovieCreditsRequest, successHandler: @escaping MovieCreditsDoneHandler, errorHandler: @escaping MovieCreditsErrorHandler) {
        guard let request = request.asURLRequest() else { return }
        GenericService.getModel(urlRequest: request) { (result: Credits?) in
            successHandler(result?.credits)
        } errorHandler: { (error) in
            errorHandler(error)
        }
    }
}
