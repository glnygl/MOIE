//
//  MovieCreditsRequest.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import Foundation

class MovieCreditsRequest: Request {
    
    override init() {
        super.init()
        relativeUrl = "/person/%@/movie_credits"
        methodType = .get
    }
    
    public convenience init(personId: Int) {
        self.init()
        self.relativeUrl = String.init(format: self.relativeUrl, "\(personId)")
    }
}
