//
//  MusicDetailView.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

class MusicDetailView: UIView {
    
    var artistName: String? {
        didSet {
            artistNameKeyLabel.text = "Artist Name:"
//            artistNameKeyLabel.textAlignment = .left
            artistNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            artistNameLabel.text = artistName ?? "-"
//            artistNameLabel.textAlignment = .right
        }
    }

    var primaryGenreName: String? {
        didSet {
            primaryGenreNameKeyLabel.text = "Genres:"
//            genresKeyLabel.textAlignment = .left
            primaryGenreNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            primaryGenreNameLabel.text = primaryGenreName ?? "-"
//            genresLabel.textAlignment = .right
        }
    }
    
    var country: String? {
        didSet {
            countryKeyLabel.text = "Country:"
//            countryKeyLabel.textAlignment = .left
            countryKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            countryLabel.text = country ?? "-"
//            countryLabel.textAlignment = .right
        }
    }
    
    var collectionPrice: Double? {
        didSet {
            collectionPriceKeyLabel.text = "Collection Price:"
//            releaseDateKeyLabel.textAlignment = .left
            collectionPriceKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            collectionPriceLabel.text = "\(collectionPrice!) $"
//            releaseDateLabel.textAlignment = .right
        }
    }
  
    
    private(set) var imageView = UIImageView()
    
    private let collectionPriceKeyLabel = UILabel()
    private let collectionPriceLabel = UILabel()
    private lazy var collectionPriceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionPriceKeyLabel, UIView(), collectionPriceLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var artistNameKeyLabel = UILabel()
    private var artistNameLabel = UILabel()
    private lazy var artistNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistNameKeyLabel, UIView(), artistNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var countryKeyLabel = UILabel()
    private var countryLabel = UILabel()
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryKeyLabel, UIView(), countryLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var primaryGenreNameKeyLabel = UILabel()
    private var primaryGenreNameLabel = UILabel()
    private lazy var primaryGenreNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [primaryGenreNameKeyLabel, UIView(), primaryGenreNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        collectionPriceLabel.numberOfLines = .zero
        artistNameLabel.numberOfLines = .zero
        countryLabel.numberOfLines = .zero
        primaryGenreNameLabel.numberOfLines = .zero
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [artistNameStackView,primaryGenreNameStackView,countryStackView,collectionPriceStackView])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
