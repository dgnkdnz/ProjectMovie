//
//  Movie.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

public struct Movie: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case title
        case voteCount = "vote_count"
        case overview
    }
    
    let id: Int
    let backdropPath: String?
    let posterPath: String
    let originalTitle: String
    let title: String
    let voteCount: Int?
    let overview: String
}
