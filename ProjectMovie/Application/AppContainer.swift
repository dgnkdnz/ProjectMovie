//
//  AppContainer.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let movieService = MovieService()
    let router = AppRouter()
}
