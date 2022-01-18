//
//  MovieDetailViewModel.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {

    private let currentMovieId = 6977
    private var similarMovies: [SimilarMovieDetail] = []
     var movieDetail : MovieDetail?
    weak var delegate: MovieDetailViewModelDelegate?
    
    private let service: ApiServiceProtocol = ApiService()
    private let movieService = MovieService()
    init(delegate: MovieDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadMovieInfo() {
        guard let currentUrl = movieService.getMovieUrl(byMovieId: currentMovieId) else {
            return
        }
        service.request(for: currentUrl) { [weak self] (result: Result<MovieDetailDTO, ApiError> ) in
            switch result {
            case let .success(apiResultDTO):
                self?.movieDetail = MovieDetail(title: apiResultDTO
                                                    .title,
                                               likes: apiResultDTO.voteCount?
                                                    .divideBy1000() ?? 0,
                                               views: apiResultDTO
                                                    .popularity ?? 0,
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
        
        service.request(for: similarMoviesURL) { [weak self] (result: Result<SimilarMoviesListDTO, ApiError> ) in
            switch result {
            case let .success(apiResultDTO):
                self?.similarMovies = apiResultDTO.results.compactMap {
                    guard let path = $0.posterPath
                    else { return nil }
                    
                    let posterImage = ApiImageView()
                    posterImage.donwloadImage(withUrl: self?.movieService.getMovieImageURL(path: path) ?? "")
                    var movie = SimilarMovieDetail(
                        title: $0.title,
                        year: $0.releaseDate?.getInitialCharacters(4) ?? "TODO handle error",
                        genre: "",
                        imageURL: self?.movieService.getMovieImageURL(path: path),
                        movieId: $0.id,
                        postImage: posterImage)
                    
                    
                    return movie
                }
 
                //TODO set genre in a better way
                if let similarMovies = self?.similarMovies {
                    for i in 0..<(self?.similarMovies.count ?? 0) {
                        self?.getMovieGenreBy(movieId: self?.similarMovies[i].movieId ?? 0, completion: { genre in
                            self?.similarMovies[i].genre = genre ?? "not working"
                        })
                    }
                    
                }
                self?.delegate?.didLoad()
                
            case let .failure(error):
                print("FAIL to parse")
                break
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.delegate?.didLoad()
            print("didload 3")
        }
        
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        similarMovies.count + 1
    }
    
    func similarMovieDetailTransporter(_ indexPath: IndexPath) -> SimilarMovieDetail {
        similarMovies[indexPath.row - 1]
    }
    
    func movieDetailTransporter(_ indexPath: IndexPath) -> MovieDetail? {
        
        return movieDetail
    }
    
    func getMovieGenreBy(movieId: Int, completion: @escaping (String?) -> Void) {
        
        guard let currentUrl = movieService.getMovieUrl(byMovieId: movieId) else {
            return
        }
        service.request(for: currentUrl) { [weak self] (result: Result<MovieGenreListDto, ApiError> ) in
            switch result {
            case let .success(apiResultDTO):
                let genreString = "\(apiResultDTO.genres[0].name ?? "") \(apiResultDTO.genres[1].name ?? "")"
                completion(genreString)
                
            case let .failure(error):
                print(" \(error)")
                break
            }
        }
       return
    
    }
}
