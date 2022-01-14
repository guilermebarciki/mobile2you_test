//
//  SimilarMovie.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

struct SimilarMovieDetail: Decodable {
    let title: String?
    let year: String?
    let genre: String?
    let imageURL: URL?
}
