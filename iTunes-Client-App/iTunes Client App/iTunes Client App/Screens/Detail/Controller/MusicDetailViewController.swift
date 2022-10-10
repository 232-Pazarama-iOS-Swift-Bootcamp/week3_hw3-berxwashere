//
//  MusicDetailViewController.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

class MusicDetailViewController: UIViewController {
    
    var music: Music? {
        didSet {
            title = music?.trackName
            musicDetailView.imageView.downloadImage(from: music?.artworkLarge)
            musicDetailView.collectionPrice = music?.collectionPrice
            musicDetailView.artistName = music?.artistName
            musicDetailView.country = music?.country
            musicDetailView.primaryGenreName = music?.primaryGenreName
        }
    }
    
    private let musicDetailView = MusicDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = musicDetailView
    }
}

