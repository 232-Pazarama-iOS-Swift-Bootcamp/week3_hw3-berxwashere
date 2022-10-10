//
//  MovieDetailViewController.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    var movie: Movie? {
        didSet {
            title = movie?.trackName
            movieDetailView.imageView.downloadImage(from: movie?.artworkLarge)
            movieDetailView.artistName = movie?.artistName
            movieDetailView.country = movie?.country
            movieDetailView.releaseDate = movie?.releaseDate
            movieDetailView.primaryGenreName = movie?.primaryGenreName
        }
    }
    
    private let movieDetailView = MovieDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = movieDetailView
    }
}
