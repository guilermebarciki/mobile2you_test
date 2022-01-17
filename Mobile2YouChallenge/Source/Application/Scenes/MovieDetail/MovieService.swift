//
//  MovieService.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 17/01/22.
//

import Foundation

final class MovieService {
    
    private let service = ApiService() // TODO make testable
    private var currentUrl = URL(string: "https://api.themoviedb.org/3/movie/6977?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US")
    
    private var similarMoviesURL = URL(string: "https://api.themoviedb.org/3/movie/6977/similar?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US&page=1")
    
    
}
