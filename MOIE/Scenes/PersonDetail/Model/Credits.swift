//
//  Credits.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import Foundation

struct Credits: Codable {
    let credits: [Credit]?
    
    enum CodingKeys: String, CodingKey {
        case credits = "cast"
    }
}

struct Credit: Codable {
    let cover: String?
    
    enum CodingKeys: String, CodingKey {
        case cover = "poster_path"
    }
}
