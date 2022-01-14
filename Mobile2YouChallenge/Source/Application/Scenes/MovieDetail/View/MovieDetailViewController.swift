//
//  MovieDetailViewController.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    let models = [
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds",
        "sfdsfds"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        header.imageView.image = UIImage(named: "Image")
        tableView.tableHeaderView = header
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        // Do any additional setup after loading the view.
        
    }
    
   
    
    
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
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
           cell.configure()
           return cell
         }
        
        
        

       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        100
//    }
}

extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        
        header.scrollViewDidScroll(scrollView: tableView)
    }
    
}
