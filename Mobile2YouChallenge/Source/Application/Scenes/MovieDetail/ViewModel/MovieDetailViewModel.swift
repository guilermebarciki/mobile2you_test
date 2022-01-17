//
//  MovieDetailViewModel.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private var similarMovies: [SimilarMovieDetail] = []
    
    private var movieDetail : MovieDetail = MovieDetail(title: "", likes: 0, views: 0)
    private var currentUrl = URL(string: "https://api.themoviedb.org/3/movie/6977?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US")
    
    private var similarMoviesURL = URL(string: "https://api.themoviedb.org/3/movie/6977/similar?api_key=be5c32db82fc40f21fa05d770dc3bea2&language=en-US&page=1")
    
   
    weak var delegate: MovieDetailViewModelDelegate?
    
    private let service: ApiServiceProtocol = ApiService() // TODO make testable
    
    init(delegate: MovieDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func loadMovieInfo() {
        movieDetail = MovieDetail(title: "Onde os Fracos Não Tem Vez", likes: 1234, views: 122.3)
        
        guard let currentUrl = currentUrl else {
            return
        }
                service.loadMovieDetail(for: currentUrl) { result in
                    print("resukt\(result)")
                    switch result {
                    case let .success(apiResultDTO):
                        
                        self.movieDetail.title = apiResultDTO.title ?? "" //TODO do that in a better way
                        self.movieDetail.likes = apiResultDTO.vote_count?.divideBy1000() ?? 0
                        self.movieDetail.views = apiResultDTO.popularity ?? 0
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
        // REQUISITAR API
        
        guard let similarMoviesURL = similarMoviesURL else {
            return
        }
                service.loadSimilarMovies(for: similarMoviesURL) { result in
                    switch result {
                    case let .success(apiResultDTO):
                        var auxObj: SimilarMovieDetail = SimilarMovieDetail(title: "", year: "", genre: "", imageURL: "")
                        
                        //TODO do that in a better way
                        for movie in apiResultDTO.results {
                            
                            auxObj.title = movie.title
                            auxObj.genre = "genre"
                            auxObj.year = movie.release_date?.getInitialCharacters(4) ?? "can't load"
                            print(movie.release_date)
                            let baseURL = "https://image.tmdb.org/t/p/original/\(movie.poster_path!)"
                            auxObj.imageURL = baseURL
                            
                            if let url1 = movie.poster_path {
                                print("URL IMAGEM \(baseURL)")
                            }
                            print("gnre id: \(movie.genre_ids)") //TODO do a method to show genre by id
                            
                            
                            
                            self.similarMovies.append(auxObj)
                           
                            
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
    
    func movieDetailTransporter(_ indexPath: IndexPath) -> MovieDetail {
        
        return movieDetail
    }
    
   
    
    
}
