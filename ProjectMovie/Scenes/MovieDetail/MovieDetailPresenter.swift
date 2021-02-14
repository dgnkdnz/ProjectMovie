//
//  MovieDetailPresenter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    private weak var view: MovieDetailViewProtocol?
    private let interactor: MovieDetailInteractorProtocol
    private let router: MovieDetailRouterProtocol
    private let movie: Movie!
    
    init(view: MovieDetailViewProtocol,
         interactor: MovieDetailInteractorProtocol,
         router: MovieDetailRouterProtocol,
         movie: Movie) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movie = movie
    }
    
    func load() {
        let moviePresentation = MovieDetailPresentation(movie: self.movie)
        self.view?.handleOutput(.showMovieDetail(moviePresentation))
    }
    
    func goBack() {
        self.router.navigate(to: .back)
    }
}
