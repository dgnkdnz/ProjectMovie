//
//  MovieListContracts.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

// MARK: - Interactor

protocol MovieListInteractorProtocol: class {
    var delegate: MovieListInteractorDelegate? { get set }
    func load()
    func loadMore()
    func search(withKeyword keyword: String)
    func movieDetail(withIndex index: Int)
}

enum MovieListInteractorOutput {
    case setLoading(Bool)
    case showMovies([Movie])
    case showMovieDetail(Movie)
}

protocol MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput)
}

// MARK: - Presenter

protocol MovieListPresenterProtocol: BasePresentProtocol {
    func load()
    func loadMore()
    func search(withKeyword keyword: String)
    func movieDetail(withIndex index: Int)
}

enum MovieListPresenterOutput {
    case setLoading(Bool)
    case showMovies([MovieListPresentation])
}

// MARK: - Router

enum MovieListRoute {
    case detail(Movie)
}

protocol MovieListRouterProtocol: class {
    func navigate(to route: MovieListRoute)
}

// MARK: - View

protocol MovieListViewProtocol: class {
    func handleOutput(_ output: MovieListPresenterOutput)
}
