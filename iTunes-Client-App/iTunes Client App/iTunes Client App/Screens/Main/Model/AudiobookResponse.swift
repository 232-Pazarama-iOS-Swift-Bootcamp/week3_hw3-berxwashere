//
//  AudiobookResponse.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct AudiobookResponse: Decodable {
    let resultCount: Int?
    let results: [Audiobook]?
}
