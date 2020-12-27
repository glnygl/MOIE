//
//  PersonDetailRequest.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import Foundation

class PersonDetailRequest: Request {
    
    override init() {
        super.init()
        relativeUrl = "/person/%@"
        methodType = .get
    }
    
    public convenience init(personId: Int) {
        self.init()
        self.relativeUrl = String.init(format: self.relativeUrl, "\(personId)")
    }
}
