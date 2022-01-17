//
//  MovieDetailViewModel.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private var similarMovies: [SimilarMovieDetail] = []
    
    private var movieDetail : MovieDetail?
    private var currentUrl = URL(string: "https://api.themoviedb.org/3/movie/6977?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US")
    
    private var similarMoviesURL = URL(string: "https://api.themoviedb.org/3/movie/6977/similar?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US&page=1")
    
   
    weak var delegate: MovieDetailViewModelDelegate?
    
    private let service: ApiServiceProtocol = ApiService() // TODO make testable
    
    init(delegate: MovieDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadMovieInfo() {
        
        
        guard let currentUrl = currentUrl else {
            return
        }
                service.loadMovieDetail(for: currentUrl) { result in
                    switch result {
                    case let .success(apiResultDTO):
                        self.movieDetail = MovieDetail(title: apiResultDTO.title,
                                                       likes: apiResultDTO.voteCount?.divideBy1000() ?? 0,
                                                       views: apiResultDTO.popularity ?? 0,
                                                       posterURL: apiResultDTO.posterPath)
                        self.delegate?.didLoad()
                        print("api result \(apiResultDTO)")
                    case let .failure(error):
                        print("api result \(error)")
                        break // TODO
                    }
                }
        self.delegate?.didLoad()
    }
    
    func loadSimilarMovies() {
        guard let similarMoviesURL = similarMoviesURL else {
            return
        }
                service.loadSimilarMovies(for: similarMoviesURL) { result in
                    switch result {
                    case let .success(apiResultDTO):
                        self.similarMovies = apiResultDTO.results.compactMap {
                        guard let path = $0.posterPath
                        else { return nil }
                        return .init(
                            title: $0.title,
                            year: $0.releaseDate?.getInitialCharacters(4) ?? "TODO handle error",
                            genre: "// TODO",
                            imageURL: "https://image.tmdb.org/t/p/original/\(path)")
                    }
                    self.delegate?.didLoad()
                        
                    case let .failure(error):
                        print("FAIL to parse")
                        break // TODO
                    }
                   
        
                }
        
        
        
        
        
        
        
        
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
    
    func movieDetailTransporter(_ indexPath: IndexPath) -> MovieDetail? {
        
        return movieDetail
    }
    
   
    
    
}
