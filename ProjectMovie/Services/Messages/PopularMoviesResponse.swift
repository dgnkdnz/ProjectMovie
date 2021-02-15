//
//  PopularMoviesResponse.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 15.02.2021.
//

import Foundation

public final class PopularMoviesResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies = "results"
    }
    
    var page: Int
    let totalPages: Int
    let totalResults: Int
    var movies: [Movie]
}
