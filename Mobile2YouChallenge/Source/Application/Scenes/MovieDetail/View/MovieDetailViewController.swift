//
//  MovieDetailViewController.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    //MARK: - Properties  
    
    private lazy var viewModel = MovieDetailViewModel(delegate: self)
    private lazy var tableView = MovieDetailView()
    private let  movieService = MovieService()
    
    override func loadView() {
            view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.bind(dataSource: self, delegate: self)
        tableView.frame = view.bounds
        viewModel.loadMovieInfo()
        viewModel.loadSimilarMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        
        header.imageView.donwloadImage(withUrl: movieService.getMoviePosterUrl())
        

        tableView.setHeader(header: header)
        
    }
}


//MARK: - TableView DataSource e Delegate
extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
         case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell else {
                fatalError("no cell registered")
            }//TODO dequeue using UITableView extension method
            
            let movieDetail = viewModel.movieDetailTransporter(indexPath)
           cell.configure(movieDetail: movieDetail)
           return cell
         
         default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else {
                fatalError("no cell registered")
            }//TODO dequeue using UITableView extension method
            let similarMovie = viewModel.similarMovieDetailTransporter(indexPath)
            cell.configure(similarMovie: similarMovie, delegate: self)
           return cell
         }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
}
//MARK: - ScrollView Delegate
extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.getHeader() as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView.tableView) //TODO fix that
    }
}

//MARK: - ViewModel Delegate
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }    
}




