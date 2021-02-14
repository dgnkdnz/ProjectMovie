//
//  MovieListRouter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieListRouter: MovieListRouterProtocol {
    
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            let movieDetailView = MovieDetailBuilder.Build(withMovie: movie)
            self.view?.show(movieDetailView, sender: nil)
        default:
            break
        }
    }
}
