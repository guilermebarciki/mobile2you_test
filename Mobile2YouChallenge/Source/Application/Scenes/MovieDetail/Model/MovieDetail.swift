//
//  MovieDetail.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

struct MovieDetail {
    var title: String?
    var likes: Double?
    var views: Double?
    
}


struct MovieDetailDTO: Decodable {
    let title: String?
    let vote_count: Double?
    let popularity: Double?
    let release_date: String?
    let backdrop_path: String?
    let genre_ids: [Int]
    
}
