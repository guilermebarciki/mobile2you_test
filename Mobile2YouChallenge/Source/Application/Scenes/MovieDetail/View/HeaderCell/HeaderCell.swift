//
//  HeaderCell.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 14/01/22.
//

import Foundation
import UIKit

class HeaderCell: UITableViewCell {
    
    //MARK: - UI itens
 
    ///tittle
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28, weight: .bold)
        
        return label
    }()
    ///likesLabel
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
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
    
    lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
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
        button.tintColor = .white
        return button
    }()

    //MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        constraintSubviews()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - PRIVATE METHODS
    private func addSubviews() {
        contentView.addSubview(likeButton)
        setupLikeButton()
        contentView.addSubview(titleLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(likesIcon)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(viewsIcon)
        updateButtonState()
        constraintSubviews()
    }
    
    
    @objc
    private func likeButtonPressed() {
        likeButton.isSelected = !likeButton.isSelected
        updateButtonState()
    }
    
    private func setupLikeButton() {
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        likeButton.isSelected = false
    }
    
    private func updateButtonState() {
        let heartConfig = UIImage.SymbolConfiguration(
            font: UIFont.preferredFont(forTextStyle: .title1)
        )
        if likeButton.isSelected {
            if let image = UIImage(systemName: "heart.fill", withConfiguration: heartConfig) {
                likeButton.setImage(image, for: .normal)
            }
            
        } else {
            if let image = UIImage(systemName: "heart", withConfiguration: heartConfig) {
                likeButton.setImage(image, for: .normal)
            }
        }
    }
    
    private func constraintSubviews() {
        
       ///title
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor)
        ])
        
        ///like Button
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])

        ///likes
         NSLayoutConstraint.activate([
            likesLabel.leadingAnchor.constraint(equalTo: likesIcon.trailingAnchor, constant: 5),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            likesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
         ])
        /// like icon
        NSLayoutConstraint.activate([
            likesIcon.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            likesIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)])
  
        ///views
         NSLayoutConstraint.activate([
            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: viewsIcon.trailingAnchor,constant: 5)
         ])
         ///views icon
        NSLayoutConstraint.activate([
            viewsIcon.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            viewsIcon.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 10)])
    }
    
    
    //MARK: - Internal API
    
    public func configure(movieDetail: MovieDetail?) {
        titleLabel.text = movieDetail?.title
        likesLabel.text = "\(movieDetail?.likes ?? 0)K Likes"
        viewsLabel.text = "\(((movieDetail?.views ?? 0) * 10 ).rounded() / 10)K Views"
    }
}


