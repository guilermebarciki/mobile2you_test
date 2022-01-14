//
//  HeaderCell.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 14/01/22.
//

import Foundation
import UIKit

class HeaderCell: UITableViewCell {
    
    /// UI itens
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        
        return label
    }()
    
    lazy var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    lazy var views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
  
    
    /// Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        constraintSubviews()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(title)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        constraintSubviews()
    }
    
    func constraintSubviews() {
        
       ///title
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        ///likes
         NSLayoutConstraint.activate([
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            likes.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10)
         ])
        
        ///views
         NSLayoutConstraint.activate([
            views.centerYAnchor.constraint(equalTo: likes.centerYAnchor),
            views.leadingAnchor.constraint(equalTo: likes.trailingAnchor, constant: 10)
         ])
        
        // contentview height
//        NSLayoutConstraint.activate([
//            contentView.heightAnchor.constraint(equalToConstant: 70)])
    }
    
    
    //MARK: - Internal API
    
    func configure() {
        title.text = "Piratas do Caribe DAS TREVAS MORTAIS "
        title.textColor = .white
        title.numberOfLines = 2
        
        
        likes.text = "1.2k Likes"
        likes.textColor = .white
        
        views.text = "1.3k Views"
        views.textColor = .white
        
    }
}
