//
//  MovieCell.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 13/01/22.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    
    /// UI itens
    lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints  = false
        return image
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        
        return label
    }()
    lazy var year: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    lazy var genre: UILabel = {
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
        contentView.addSubview(movieImage)
        contentView.addSubview(title)
        contentView.addSubview(year)
        contentView.addSubview(genre)
    }
    
    func constraintSubviews() {
        ///movieImage
        NSLayoutConstraint.activate([

            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImage.widthAnchor.constraint(equalToConstant: 70),
            movieImage.heightAnchor.constraint(equalToConstant: 90)
            
            
        ])
        ///title
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        ///year
        NSLayoutConstraint.activate([
            year.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 10),
            year.topAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        ///genre
        NSLayoutConstraint.activate([
            genre.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            genre.leadingAnchor.constraint(equalTo: year.trailingAnchor, constant: 10)
        ])
    }
    
    
    //MARK: - Internal API
    
    func configure() {
        title.text = "title"
        title.numberOfLines = 0
        title.textColor = .white
        
        year.text = "year"
        year.textColor = .white
        
        genre.text = "genre"
        genre.textColor = .white
    }
}