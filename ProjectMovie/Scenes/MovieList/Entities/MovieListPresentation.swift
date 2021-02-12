//
//  MovieListPresentation.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieListPresentation: BasePresentationProtocol {
    let title: String
    let posterPath: URL
    let backdropPath: URL
    
    init(movie: Movie) {
        self.title = movie.originalTitle
        self.posterPath = URL(string: String(format: "%@%@", ServiceConstants.posterPathBaseUrl, movie.posterPath))!
        self.backdropPath = URL(string: String(format: "%@%@", ServiceConstants.posterPathBaseUrl, movie.backdropPath))!
    }
}
