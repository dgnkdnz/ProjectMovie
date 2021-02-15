//
//  MovieDetailPresenter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    private weak var view: MovieDetailViewProtocol?
    private let router: MovieDetailRouterProtocol
    private let interactor: MovieDetailInteractorProtocol
    private let movie: Movie!
    
    init(view: MovieDetailViewProtocol,
         interactor: MovieDetailInteractor,
         router: MovieDetailRouterProtocol,
         movie: Movie) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.movie = movie
        
        self.interactor.delegate = self
    }
    
    func load() {
        let moviePresentation = MovieDetailPresentation(movie: self.movie)
        self.view?.handleOutput(.showMovieDetail(moviePresentation))
        self.interactor.load(withId: movie.id)
    }
    
    func favoriteMovie() {
        self.interactor.favorite(withId: movie.id)
    }
    
    func goBack() {
        self.router.navigate(to: .back)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorDelegate {
    func handleOutput(_ output: MovieDetailInteractorOutput) {
        switch output {
        case .favorite(let isFavorite):
            self.view?.handleOutput(.favorite(isFavorite))
        default:
            break
        }
    }
}
