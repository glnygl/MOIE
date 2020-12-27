//
//  URL+Extensions.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation

extension URL {

    mutating func appendQueryItem(name: String, value: String?) {

        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        if let url = urlComponents.url {
            self = url
        }
    }
}
