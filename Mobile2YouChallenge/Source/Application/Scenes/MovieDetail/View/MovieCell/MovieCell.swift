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
    lazy var movieImage: ApiImageView = {
        let image = ApiImageView()
        image.translatesAutoresizingMaskIntoConstraints  = false
        return image
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    lazy var year: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    lazy var genre: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var divisorLine: UIImageView =
    {
        let line = UIImageView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .systemGray
        return line
    }()
    
    var canLoad: Bool = true
    
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
        contentView.addSubview(divisorLine)
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
        ///divisorLine
        NSLayoutConstraint.activate([
            divisorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            divisorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divisorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            divisorLine.heightAnchor.constraint(equalToConstant:  0.5)
        ])
    }
    
    override func prepareForReuse() {
        movieImage.cancel()
        movieImage.image = nil
        canLoad = true
    }
    
    //MARK: - Internal API
    
    func configure(similarMovie: SimilarMovieDetail, delegate: MovieDetailViewModelDelegate) {
        title.numberOfLines = 0
        title.text = similarMovie.title
        year.text = similarMovie.year
        genre.text = similarMovie.genre
        
        if canLoad {
            if let url = similarMovie.imageURL {
                movieImage.donwloadImage(withUrl: url)
                canLoad = false
            }
            else {
                print("imageUrl invalid") }
        }
    }
}
