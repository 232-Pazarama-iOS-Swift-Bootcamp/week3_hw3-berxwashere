//
//  MusicResponse.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}
