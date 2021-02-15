//
//  MovieListBuilder.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieListBuilder {
    static func build() -> MovieListViewController {
        let storyboard = UIStoryboard(storyboard: .movieList)
        let view = storyboard.instantiateViewController(withStoryboardIdentifiers: .movieListViewController) as! MovieListViewController
        let router = MovieListRouter(view: view)
        let interactor = MovieListInteractor(service: app.movieService, userDefaultsService: app.userDefaultsService)
        let presenter = MovieListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
