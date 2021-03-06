//
//  MovieDetailView.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 14/01/22.
//

import Foundation
import UIKit



final class MovieDetailView: UIView {
    
    // MARK: - UI Components
    
     var tableView: UITableView = {
        let tableView = UITableView()
         tableView.register(MovieCell.self)
         tableView.register(HeaderCell.self)
         tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
     }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        constraintSubviews()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Lifecycle
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    func constraintSubviews() {

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Internal API

    func bind(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    func setHeader(header: UIView ) {

        tableView.tableHeaderView = header
        tableView.reloadData()
    }
    
    func getHeader() -> UIView? {
        tableView.tableHeaderView
    }
    
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func dequeue<T: UITableViewCell>(_ type: T.Type, at indexPath: IndexPath) -> T{
        let cell = tableView.dequeue(T.self, at: indexPath)
    return cell
  }
}


