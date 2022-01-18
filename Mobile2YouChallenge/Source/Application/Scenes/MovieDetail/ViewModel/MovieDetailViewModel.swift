//
//  MovieDetailViewModel.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private var similarMovies: [SimilarMovieDetail] = []
     var movieDetail : MovieDetail?
    weak var delegate: MovieDetailViewModelDelegate?
    
    private let service: ApiServiceProtocol = ApiService() // TODO make testable
    private let movieService = MovieService()
    init(delegate: MovieDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadMovieInfo() {
        
        
        guard let currentUrl = movieService.getMovieUrl() else {
            return
        }
        service.loadMovieDetail(for: currentUrl) { [weak self] result in
            switch result {
            case let .success(apiResultDTO):
                self?.movieDetail = MovieDetail(title: apiResultDTO.title,
                                               likes: apiResultDTO.voteCount?.divideBy1000() ?? 0,
                                               views: apiResultDTO.popularity ?? 0,
                                               posterURL: self?.movieService
                                                .getMovieImageURL(path: apiResultDTO.posterPath ?? ""))
                
                self?.delegate?.didLoad()
            case let .failure(error):
                print("api result \(error)")
                break // TODO
            }
        }
        self.delegate?.didLoad()
    }
    
    func loadSimilarMovies() {
        guard let similarMoviesURL = movieService.getSimilarMoviesURL() else {
            return
        }
        service.loadSimilarMovies(for: similarMoviesURL) { [weak self] result in
            switch result {
            case let .success(apiResultDTO):
                self?.similarMovies = apiResultDTO.results.compactMap {
                    guard let path = $0.posterPath
                    else { return nil }
                    return .init(
                        title: $0.title,
                        year: $0.releaseDate?.getInitialCharacters(4) ?? "TODO handle error",
                        genre: "// TODO",
                        imageURL: self?.movieService.getMovieImageURL(path: path))
                }
                self?.delegate?.didLoad()
                
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
