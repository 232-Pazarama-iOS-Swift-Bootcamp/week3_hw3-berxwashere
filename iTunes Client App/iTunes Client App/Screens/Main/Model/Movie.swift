//
//  Movie.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct Movie: Decodable {
    let trackName: String?
    let artistName: String?
    let country: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case country
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case primaryGenreName
    }
}
