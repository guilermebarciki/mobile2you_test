//
//  MovieDetailViewController.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    
    
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
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        header.imageView.image = UIImage(named: "Image")
        tableView.tableHeaderView = header
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        
        header.scrollViewDidScroll(scrollView: tableView)
    }
    
}
