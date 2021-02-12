//
//  PopularMovies.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

public struct PopularMovies: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies = "results"
    }
    
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let movies: [Movie]
}
