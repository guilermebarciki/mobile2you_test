//
//  MovieService.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 17/01/22.
//

import Foundation

final class MovieService {
    
    private let apiKey = "be5c32db82fc40f21fa05d770dc3bea2"
    private let movieId = 6977
    private var movieUrl: URL?
    private var similarMoviesURL: URL?
    
    init() {
        movieUrl = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)&language=en-US")
        similarMoviesURL = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=\(apiKey)&language=en-US&page=1")
    }
    
    func getMovieUrl() -> URL?{
        movieUrl
    }
    
    func getSimilarMoviesURL() -> URL? {
        similarMoviesURL
    }
    
    func getMovieImageURL(path: String) -> String {
        "https://image.tmdb.org/t/p/original\(path)"
    }
    
    
    
}
