//
//  MovieListPresenter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    
    private weak var view: MovieListViewProtocol?
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    
    init(view: MovieListViewProtocol,
         interactor: MovieListInteractorProtocol,
         router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        self.interactor.load()
    }
    
    func loadMore() {
        self.interactor.loadMore()
    }
    
    func movieDetail(withIndex index: Int) {
        self.interactor.movieDetail(withIndex: index)
    }
    
    func search(withKeyword keyword: String) {
        self.interactor.search(withKeyword: keyword)
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .showMovies(let popularMovies):
            let movieListPresenters = popularMovies.map({ MovieListPresentation(movie: $0) })
            self.view?.handleOutput(.showMovies(movieListPresenters))
        case .showMovieDetail(let movie):
            self.router.navigate(to: .detail(movie))
            break
        default:
            break
        }
    }
}
