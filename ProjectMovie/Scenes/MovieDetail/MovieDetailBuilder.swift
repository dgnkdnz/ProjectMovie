//
//  MovieDetailBuilder.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieDetailBuilder {
    
    static func Build(withMovie movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(storyboard: .movieDetail)
        let view = storyboard.instantiateViewController(withStoryboardIdentifiers: .movieDetailViewController) as! MovieDetailViewController
        let router = MovieDetailRouter(view: view)
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(view: view, interactor: interactor, router: router, movie: movie)
        view.presenter = presenter
        return view
    }
}
