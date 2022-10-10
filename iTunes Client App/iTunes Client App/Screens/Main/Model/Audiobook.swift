//
//  Audiobook.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct Audiobook: Decodable {
    let collectionName: String?
    let artistName: String?
    let artworkLarge: URL?
    let collectionPrice: Double?
    let primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case collectionName
        case artistName
        case artworkLarge = "artworkUrl100"
        case collectionPrice
        case primaryGenreName
    }
}
