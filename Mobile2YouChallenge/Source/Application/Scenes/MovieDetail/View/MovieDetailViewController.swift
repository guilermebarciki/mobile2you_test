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
    private let tableViewx: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var tableView = MovieDetailView()
    
    override func loadView() {
        
            view = tableView
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        tableView.bind(dataSource: self)
        tableView.frame = view.bounds
        
        
       
         
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        header.imageView.image = UIImage(named: "Image")
        tableView.setHeader(header: header)
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
         case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell else {
                fatalError("no cell registered")
            }
           cell.configure()
           return cell
         
         default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else {
                fatalError("no cell registered")
            }
           cell.configure()
           
           return cell
         }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        16
    }
    
}

extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.getHeader() as? StretchyTableHeaderView else {
            return
        }

        header.scrollViewDidScroll(scrollView: tableView.tableView) //TODO fix that
    }
    
}

//extension MovieDetailViewController:

