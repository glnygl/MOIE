//
//  ImageRequest.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import Foundation

class ImageRequest: Request {
    
    override init() {
        super.init()
        serviceUrl = "https://image.tmdb.org/t/p/original"
        methodType = .get
    }
    
    public convenience init(imageUrl: String) {
        self.init()
        self.relativeUrl = "\(imageUrl)"
    }
    
}
