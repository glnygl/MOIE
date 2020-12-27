//
//  Request.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Alamofire

class Cache {
    static let shared = NSCache< NSString, UIImage>()
}

class Request {
    var apiKey = ""
    var serviceUrl = ""
    var relativeUrl = ""
    var methodType: Alamofire.HTTPMethod = .get
    var params: [String: String]?
    
    init() {
        readConfig()
    }
    
    func readConfig() {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                self.serviceUrl = dict["ServiceUrl"] as? String ?? ""
                self.apiKey = dict["ApiKey"] as? String ?? ""
            }
        }
    }
}


extension Request {
    func asURLRequest() -> URLRequest? {
        if var url = URL(string: self.serviceUrl + self.relativeUrl) {
            url.appendQueryItem(name: "api_key", value: self.apiKey)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = self.methodType.rawValue
            if let parameters = self.params {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    return nil
                }
            }
            return urlRequest
        } else { return nil }
    }
}
