//
//  MovieDetailViewModel.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private var similarMovies: [SimilarMovieDetail] = []
    
    private var movieDetail : MovieDetail = MovieDetail(title: "", likes: "", views: "")
    weak var delegate: MovieDetailViewModelDelegate?
    
    init(delegate: MovieDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadMovieInfo() {
        movieDetail = MovieDetail(title: "Onde os Fracos Não Tem Vez", likes: "3223", views: "32323")
        self.delegate?.didLoad()
    }
    
    func loadSimilarMovies() {
        // REQUISITAR API
        similarMovies = [SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa")),
                         SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa")),
                         SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa")),
                         SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa")),
                         SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa")),
                         SimilarMovieDetail(title: "dasds", year: "dasdsa", genre: "dadsada", imageURL: URL(string: "dasdsa"))]
        self.delegate?.didLoad()
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        similarMovies.count + 1 //TODO fix that
    }
    
    func similarMovieDetailTransporter(_ indexPath: IndexPath) -> SimilarMovieDetail {
        similarMovies[indexPath.row - 1] // TODO fix that
    }
    
    func movieDetailTransporter(_ indexPath: IndexPath) -> MovieDetail {
        
        return movieDetail
    }
    
    func showMovies() {
        var a = 2
    }
    
    
}
