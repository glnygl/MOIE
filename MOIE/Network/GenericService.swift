//
//  GenericService.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Alamofire

class GenericService {
    
    static func getModel<T: Codable>(urlRequest: URLRequest, successHandler: @escaping (T?) -> Void, errorHandler: @escaping (Error?) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                errorHandler(error)
            }else{
                guard let data = data, let model: T = data.decode() else {
                    successHandler(nil)
                    return
                }
                successHandler(model)
            }
        }.resume()
    }
    
    func downloadImage(_ url: URL, completion: @escaping (_ fileUrl: URL?) -> Void) {

          let cachesUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
          let fileUrl = cachesUrl.appendingPathComponent(url.lastPathComponent)

          if FileManager.default.fileExists(atPath: fileUrl.path) {
              completion(fileUrl)
          } else {

              let destination = DownloadRequest.suggestedDownloadDestination()
              AF.download(url, to: destination).response { response in
                  completion(response.fileURL)
              }
          }
      }
}

extension Data {
    
    func decode<T: Codable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    
}
