//
//  MovieDetailPresentation.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 14.02.2021.
//

import Foundation

final class MovieDetailPresentation: BasePresentationProtocol {
    let imageUrl: URL
    let title: String
    let overview: String
    let voteCount: String
    
    init(movie: Movie) {
        self.imageUrl = URL(string: String(format: "%@%@", ServiceConstants.posterPathBaseUrl, movie.posterPath))!
        self.title = movie.title
        self.overview = movie.overview
        self.voteCount = String(movie.voteCount ?? 0)
    }
}
