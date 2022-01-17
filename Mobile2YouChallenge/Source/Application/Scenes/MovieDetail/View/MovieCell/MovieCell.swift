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
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints  = false
        image.contentMode = .scaleAspectFit
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
    
    func configure(similarMovie: SimilarMovieDetail) {
        
        
        
        title.numberOfLines = 0
        title.text = similarMovie.title
        
        year.text = similarMovie.year
        
        
        genre.text = similarMovie.genre
        print("carregando imagem")
       
        
//            movieImage.donwloadImage(withUrl: "https://camo.githubusercontent.com/9c2e0652eaea989f1b63f889c779337f7875554f987b806edba337df002e4fdc/68747470733a2f2f692e6962622e636f2f525456625733592f53696d756c61746f722d53637265656e2d53686f742d692d50686f6e652d31322d323032312d31302d31372d61742d32322d35332d31352e706e67")
        
        do{
        
        if let url = similarMovie.imageURL {
            print("url image:   \(url)")
            movieImage.donwloadImage(withUrl: try String(contentsOf: url))
        }

        } catch {
            print("url invalid")
        }

        
    }
}
