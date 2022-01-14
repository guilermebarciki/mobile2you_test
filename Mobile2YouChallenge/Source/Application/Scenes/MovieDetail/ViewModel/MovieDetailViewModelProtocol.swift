//
//  MovieDetailViewModelProtocol.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation


protocol MovieDetailViewModelProtocol {
    func loadMovieInfo()
    func loadSimilarMovies()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func transporter(_ indexPath: IndexPath) -> String
    func showMovies()
    
}
