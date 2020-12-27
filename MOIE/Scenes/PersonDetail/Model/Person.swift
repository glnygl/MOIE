//
//  Person.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import Foundation

struct Person: Codable {
    let id: Int?
    let name: String?
    let gender: Int?
    let birthday: String?
    let biography: String?
    let job: String?
    let cover: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, birthday, biography
        case cover = "profile_path"
        case job = "known_for_department"
    }
}
