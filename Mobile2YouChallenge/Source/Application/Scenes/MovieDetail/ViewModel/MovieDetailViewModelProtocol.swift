//
//  MovieDetailViewModelProtocol.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation


protocol MovieDetailViewModelProtocol: AnyObject {
    func loadMovieInfo()
    func loadSimilarMovies()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func similarMovieDetailTransporter(_ indexPath: IndexPath) -> SimilarMovieDetail
    func movieDetailTransporter(_ indexPath: IndexPath) -> MovieDetail
    func showMovies()
    
}

protocol MovieDetailViewModelDelegate: AnyObject {
    func didLoad()
}
