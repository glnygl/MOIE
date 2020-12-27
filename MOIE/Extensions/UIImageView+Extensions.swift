//
//  UIImageView+Extensions.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import UIKit

extension UIImageView {
    func setImage(request: ImageRequest) {
        guard let request = request.asURLRequest() else { return }
        self.af.setImage(withURLRequest: request, completion: { (response) in
            DispatchQueue.main.async { [weak self] in
                guard let image = response.value, let urlString = request.url?.absoluteString  else { return }
                Cache.shared.setObject(image, forKey: urlString as NSString)
                self?.image = image
            }
        })
    }
    
    func isImageNotCashed(request: ImageRequest) -> Bool {
        guard let urlString = request.asURLRequest()?.url?.absoluteString else { return true }
        if let image = Cache.shared.object(forKey: urlString as NSString) {
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
            return false
        } else {
            return true
        }
    }
    
    func cancelImageRequest() {
        self.af.cancelImageRequest()
    }
}
