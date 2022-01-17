//
//  MovieDetail.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

struct MovieDetail {
    let title: String?
    let likes: Double?
    let views: Double?
    let posterURL: String?
}


struct MovieDetailDTO: Decodable {
    let title: String?
    let voteCount: Double?
    let popularity: Double?
    let releaseDate: String?
    let posterPath: String?
}

