//
//  LocalizableStrings.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import Foundation

struct LocalizableStrings {
    struct States {
        static var emptyState = "emptyState".localize()
        static var errorState = "errorState".localize()
    }
    struct Titles {
        static var popularMovies = "popularMovies".localize()
        static var movieDetail = "movieDetail".localize()
        static var personDetail = "personDetail".localize()
    }
    struct PersonDetail {
        static var age = "age".localize()
        static var date = "date".localize()
    }
}

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
