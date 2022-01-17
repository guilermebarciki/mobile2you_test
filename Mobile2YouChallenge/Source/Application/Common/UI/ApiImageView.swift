//
//  ApiImageView.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 16/01/22.
//

import Foundation

import UIKit

class ApiImageView: UIImageView {
    
    private let imageCache = NSCache<NSString, UIImage>()
    private var imageUrlString: String?
    
    private var currentSession: URLSessionTask?
   
    func cancel() {
        currentSession?.cancel()
    }
    
    func donwloadImage(withUrl urlString: String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            image = cachedImage
            return
        }
        
        guard let url = url else { return }
        
        currentSession = URLSession.shared.dataTask(with: url) { [handle] (data, response , error) in
            
            guard let data = data else {
                print("url", url)
                handle(error)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: NSString(string: urlString))
                    if self.imageUrlString == urlString {
                        self.image = image
                    }
                } else {
                    print("delegate error")
                }
            }
        }
        currentSession?.resume()
    }
    
    private func handle(error: Error?) {
        DispatchQueue.main.async {
            self.image = nil
        }
    }
}


