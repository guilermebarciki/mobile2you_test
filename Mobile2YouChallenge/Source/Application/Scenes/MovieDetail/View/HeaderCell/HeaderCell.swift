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
    lazy var likesIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "heart.fill")
        icon.tintColor = .white
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
       
    }()
    
    lazy var views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    lazy var viewsIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "play.tv.fill")
        icon.tintColor = .white
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let heartConfig = UIImage.SymbolConfiguration(
            font: UIFont.preferredFont(forTextStyle: .title1)
        )
 
        if let image = UIImage(systemName: "heart.fill", withConfiguration: heartConfig) {
            button.setImage(image, for: .normal)
            
   
        }
        
        button.tintColor = .white
        
        return button
    }()

    
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
        contentView.addSubview(likeButton)
        contentView.addSubview(title)
        contentView.addSubview(likes)
        contentView.addSubview(likesIcon)
        contentView.addSubview(views)
        contentView.addSubview(viewsIcon)
        
        constraintSubviews()
    }
    
    func constraintSubviews() {
        
       ///title
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor)
        ])
        
        ///like Button
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        likeButton.imageView?.contentMode = .scaleToFill
        

        print( "aaaaaaaa \(likeButton.imageView)")
   
        
        ///likes
         NSLayoutConstraint.activate([
            likes.leadingAnchor.constraint(equalTo: likesIcon.trailingAnchor, constant: 5),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            likes.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10)
         ])
        /// like icon
        NSLayoutConstraint.activate([
            likesIcon.centerYAnchor.constraint(equalTo: likes.centerYAnchor),
            likesIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)])
       
        
        
        ///views
         NSLayoutConstraint.activate([
            views.centerYAnchor.constraint(equalTo: likes.centerYAnchor),
            views.leadingAnchor.constraint(equalTo: viewsIcon.trailingAnchor,constant: 5)
         ])
         ///views icon
        NSLayoutConstraint.activate([
            viewsIcon.centerYAnchor.constraint(equalTo: likes.centerYAnchor),
            viewsIcon.leadingAnchor.constraint(equalTo: likes.trailingAnchor, constant: 10)])
        
      
       
    }
    
    
    //MARK: - Internal API
    
    func configure() {
        title.text = "Piratas do Caribe DAS TREVAS MORTAIS "
        title.textColor = .white
        title.numberOfLines = 0
        
        
        
        
        
        likes.text = "1.2k Likes"
        likes.textColor = .white
        
        views.text = "1.3k Views"
        views.textColor = .white
        
    }
}
