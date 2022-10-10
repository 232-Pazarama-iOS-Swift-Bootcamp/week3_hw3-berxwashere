//
//  AudiobookRequest.swift
//  iTunes Client App
//
//  Created by HS on 9.10.2022.
//

import Foundation

struct AudiobookRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "audiobook"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Audiobook") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> AudiobookResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(AudiobookResponse.self, from: data)
        return response
    }
}
