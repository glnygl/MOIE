//
//  PopularMoviesRequest.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

class PopularMoviesRequest: Request {
    
    override init() {
        super.init()
        relativeUrl = "/movie/popular"
        methodType = .get
    }
    
}
