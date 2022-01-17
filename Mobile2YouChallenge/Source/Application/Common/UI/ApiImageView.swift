//
//  ApiImageView.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 16/01/22.
//

import Foundation

import UIKit

class ApiImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    var imageUrlString: String?
    
    func donwloadImage(withUrl urlString: String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return
        }
        
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _ , error) in
            
            if error != nil {
                guard let error = error else { return }
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                if let image = UIImage(data: data) {
                    self?.imageCache.setObject(image, forKey: NSString(string: urlString))
                    if self?.imageUrlString == urlString {
                        self?.image = image
                    }
                }
            }
        }.resume()
    }
}
