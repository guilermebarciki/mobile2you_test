//
//  SimilarMovie.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

struct SimilarMovieDetail {
    let title: String?
    let year: String?
    var genre: String?
    let imageURL: String?
    let movieId: Int?
    let postImage: ApiImageView?
}

struct MovieGenreListDto: Decodable {
    let genres: [MovieGenreDto]
}

struct MovieGenreDto: Decodable {
    let name: String?
}

struct SimilarMoviesListDTO: Decodable {
    let results: [SimilarMovieDTO]
}

struct SimilarMovieDTO: Decodable {
    let title: String?
    let releaseDate: String?
    let posterPath: String?
    let genreIds: [Int]
    let id: Int?
}

