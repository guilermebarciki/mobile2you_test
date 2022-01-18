//
//  ApiService.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation
// key: be5c32db82fc40f21fa05d770dc3bea2

typealias MovieDetailWraperCompletionResult = ((Result<MovieDetailDTO, ApiError>) -> Void)
typealias SimilarMoviesWraperCompletionResult = ((Result<SimilarMoviesListDTO, ApiError>) -> Void)

enum ApiError: Error {
    case apiError
    case parsing(Error)
}

protocol ApiServiceProtocol {
    
    
    func request<T>(for url: URL, completion: @escaping (Result<T, ApiError>) -> Void) where T: Decodable
}



final class ApiService: ApiServiceProtocol {
    
    func request<T>(for url: URL, completion: @escaping (Result<T, ApiError>) -> Void) where T: Decodable {
       URLSession.shared.dataTask(with: url) { data, _, error in
           DispatchQueue.main.async {
               guard let data = data else {
                   completion(.failure(.apiError))
                   return
               }
               do {
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   let response = try decoder.decode(T.self, from: data)
                   completion(.success(response))
               } catch let error {
                   completion(.failure(.parsing(error)))
               }
           }
       }.resume()
   }
    
    
}
