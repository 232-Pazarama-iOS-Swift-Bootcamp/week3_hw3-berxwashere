//
//  MovieDetailView.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

final class MovieDetailView: UIView {

    var artistName: String? {
        didSet {
            artistNameKeyLabel.text = "Director:"
//            artistNameKeyLabel.textAlignment = .left
            artistNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            artistNameLabel.text = artistName ?? "-"
//            artistNameLabel.textAlignment = .right
        }
    }
    
    var primaryGenreName: String? {
        didSet {
            primaryGenreNameKeyLabel.text = "Genres:"
//            primaryGenreNameKeyLabel.textAlignment = .left
            primaryGenreNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            primaryGenreNameLabel.text = primaryGenreName ?? "-"
//            primaryGenreNameLabel.textAlignment = .right
        }
    }
    
    
    var releaseDate: String? {
        didSet {
            releaseDateKeyLabel.text = "Release Year:"
//            releaseDateKeyLabel.textAlignment = .left
            releaseDateKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            let date = releaseDate
            let dateItems = date!.components(separatedBy: "T")
            releaseDateLabel.text = dateItems[0]
//            releaseDateLabel.textAlignment = .right
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
   
    private(set) var imageView = UIImageView()
    
    private let releaseDateKeyLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private lazy var releaseDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateKeyLabel, UIView(), releaseDateLabel])
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
        
        releaseDateLabel.numberOfLines = .zero
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
        
        let stackView = UIStackView(arrangedSubviews: [artistNameStackView,
                                                       primaryGenreNameStackView,countryStackView,releaseDateStackView])
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
