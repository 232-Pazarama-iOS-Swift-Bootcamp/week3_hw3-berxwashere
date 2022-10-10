//
//  AudiobookViewController.swift
//  iTunes Client App
//
//  Created by HS on 10.10.2022.
//

import UIKit

class AudiobookViewController: UIViewController {
    // MARK: - Properties
    private let audiobookView = AudiobookView()
    private let networkService = BaseNetworkService()
    private var audiobookResponse: AudiobookResponse? {
        didSet {
            audiobookView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Audiobooks"
        view = audiobookView
        audiobookView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchAudiobooks()
        
        // Do any additional setup after loading the view.
    }
    
    private func fetchAudiobooks(with text: String = "Audiobook") {
        networkService.request(AudiobookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.audiobookResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
// MARK: - UICollectionViewDelegate
extension AudiobookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let audiobookDetailViewController = AudiobookDetailViewController()
        audiobookDetailViewController.audiobook = audiobookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(audiobookDetailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension AudiobookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        audiobookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AudiobookCollectionViewCell
        let audiobook = audiobookResponse?.results?[indexPath.row]
        let audioname = audiobook?.collectionName
        let audionameItems = audioname!.components(separatedBy: " (") // (Unabridged)
        cell.title = audionameItems[0]
        cell.imageView.downloadImage(from: audiobook?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension AudiobookViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchAudiobooks(with: text)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
