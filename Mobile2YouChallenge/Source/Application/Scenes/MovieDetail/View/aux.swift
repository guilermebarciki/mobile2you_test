//
//  aux.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 14/01/22.
//

//import Foundation
//import UIKit
//
//class MovieDetailViewController: UIViewController {
//    //MARK: - Properties
//    private let tableViewx: UITableView = {
//        let tableView = UITableView()
//        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
//        tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return tableView
//    }()
//    
//    private lazy var tableView = MovieDetailView()
//    
//    override func loadView() {
//        
//            view = tableView
//       
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .green
//        
//        tableView.bind(dataSource: self)
//        tableView.frame = view.bounds
//        
//        
//       
//         
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
//                                                           width: view.frame.size.width,
//                                                           height: view.frame.size.width))
//        header.imageView.image = UIImage(named: "Image")
//
//
//        tableView.tableView.tableHeaderView = header
//        
//        print("view frame \(self.view.frame)")
//    }
//}
//
//extension MovieDetailViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        switch indexPath.row {
//         case 0:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell else {
//                fatalError("no cell registered")
//            }
//           cell.configure()
//           return cell
//         
//         default:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else {
//                fatalError("no cell registered")
//            }
//           cell.configure()
//           
//           return cell
//         }
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        16
//    }
//    
//}
//
//extension MovieDetailViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard let header = tableView.getHeader() as? StretchyTableHeaderView else {
//            return
//        }
//
//        header.scrollViewDidScroll(scrollView: tableView.tableView)
//    }
//    
//}
//
////extension MovieDetailViewController:
//
//
//final class MovieDetailView: UIView {
//    
//    // MARK: - UI Components
//    
//     var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
//        tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
//         tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//     }()
//    
//    // MARK: - Initialization
//    
//    init() {
//        super.init(frame: .zero)
//        addSubviews()
//        constraintSubviews()
//        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 150
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - UI Lifecycle
//    
//    func addSubviews() {
//        print("add tableview")
//        addSubview(tableView)
//        
//    }
//    
//    func constraintSubviews() {
//        print("setou constraint")
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
//    }
//    
//    // MARK: - Internal API
//
//    func bind(dataSource: UITableViewDataSource) {
//        tableView.dataSource = dataSource
//    }
//    
//    func setHeader(header: UIView ) {
//        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
//                                                          width: frame.size.width,
//                                                          height: frame.size.width))
//        header.imageView.image = UIImage(named: "Image")
//        tableView.tableHeaderView = header
//        tableView.reloadData()
//    }
//    
//    func getHeader() -> UIView? {
//        tableView.tableHeaderView
//    }
//    
//    
//    func reloadData() {
//        tableView.reloadData()
//    }
//}
