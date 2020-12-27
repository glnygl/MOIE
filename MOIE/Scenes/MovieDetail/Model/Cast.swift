//
//  Cast.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import Foundation

struct Cast: Codable {
    let cast: [Actor]?
}

struct Actor: Codable {
    let id: Int?
    let name: String?
    let character: String?
    let cover: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, character
        case cover = "profile_path"
    }
}


