//
//  Genres.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import Foundation

enum Genres: Int, CaseIterable {
    case Action = 28
    case Adventure = 12
    case Animation = 16
    case Comedy = 35
    case Crime = 80
    case Documentary = 99
    case Drama = 18
    case Family = 10751
    case Fantasy = 14
    case History = 36
    case Horror = 27
    case Music = 10402
    case Mystery = 9648
    case Romance = 10749
    case ScienceFiction = 878
    case TVMovie = 10770
    case Thriller = 53
    case War = 10752
    case Western = 37
    
    static var genreDictionary: [String: String]? {
        get {
            var dic: [String: String]? = [:]
            for i in Genres.allCases {
                dic?.updateValue("\(i)", forKey: "\(i.rawValue)")
            }
            return dic
        }
    }
    
    static func getGenre(id: Int) -> String? {
        let firstGenre = Genres.genreDictionary?.filter({ $0.key == String(id)}).first
        return firstGenre?.value
    }
}
