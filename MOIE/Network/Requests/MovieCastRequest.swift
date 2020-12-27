//
//  MovieCastRequest.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

class MovieCastRequest: Request {
    
    override init() {
        super.init()
        relativeUrl = "/movie/%@/credits"
        methodType = .get
    }
    
    public convenience init(movieId: Int) {
        self.init()
        self.relativeUrl = String.init(format: self.relativeUrl, "\(movieId)")
    }
}
