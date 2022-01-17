//
//  SimilarMovie.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

struct SimilarMovieDetail {
    var title: String?
    var year: String?
    var genre: String?
    var imageURL: String?
}

struct SimilarMoviesListDTO: Decodable {
    let results: [SimilarMovieDTO]
}

struct SimilarMovieDTO: Decodable {
    let title: String?
    let releaseDate: String?
    let posterPath: String?
    let genreIds: [Int]
}

