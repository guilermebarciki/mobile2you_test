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
    var imageURL: URL?
}

struct SimilarMoviesListDTO: Decodable {
    let results: [SimilarMovieDTO]
}

struct SimilarMovieDTO: Decodable {
    let title: String?
    let release_date: String?
    let backdrop_path: String?
    let genre_ids: [Int]
}

