//
//  Music.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct Music: Decodable {
    let trackName: String?
    let artistName: String?
    let artworkLarge: URL?
    let collectionPrice: Double?
    let country: String?
    let primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case artworkLarge = "artworkUrl100"
        case collectionPrice
        case country
        case primaryGenreName
    }
}
