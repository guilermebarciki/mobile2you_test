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
    func loadMovieDetail(for url: URL, completion: @escaping MovieDetailWraperCompletionResult)
    
    func loadSimilarMovies(for url: URL, completion: @escaping SimilarMoviesWraperCompletionResult)
}

final class ApiService: ApiServiceProtocol {
    func loadMovieDetail(for url: URL, completion: @escaping MovieDetailWraperCompletionResult)
    {
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(.failure(.apiError))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try decoder.decode(MovieDetailDTO.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parsing(error)))
                }
            }
        }.resume()
    }
    
    func loadSimilarMovies(for url: URL, completion: @escaping SimilarMoviesWraperCompletionResult) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(.failure(.apiError))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try decoder.decode(SimilarMoviesListDTO.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.parsing(error)))
                }
            }
        }.resume()
    }
}
