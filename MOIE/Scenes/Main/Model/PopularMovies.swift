//
//  PopularMovies.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

struct PopularMovies: Codable {
    let results: [Movie]?
}

struct Movie: Codable {
    let id: Int?
    let genres: [Int?]
    let title: String?
    let cover: String?
    let rating: Double?
    let overview: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case rating = "vote_average"
        case cover = "poster_path"
        case genres = "genre_ids"
        case date = "release_date"
    }
}


