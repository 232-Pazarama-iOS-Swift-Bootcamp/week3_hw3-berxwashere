//
//  AudiobookDetailViewController.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

class AudiobookDetailViewController: UIViewController {
    
    var audiobook: Audiobook? {
        didSet {
            title = audiobook?.collectionName
            audiobookDetailView.imageView.downloadImage(from: audiobook?.artworkLarge)
            audiobookDetailView.artistName = audiobook?.artistName
            audiobookDetailView.collectionPrice = audiobook?.collectionPrice
            audiobookDetailView.primaryGenreName = audiobook?.primaryGenreName
        }
    }
    
    private let audiobookDetailView = AudiobookDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = audiobookDetailView
    }
}
