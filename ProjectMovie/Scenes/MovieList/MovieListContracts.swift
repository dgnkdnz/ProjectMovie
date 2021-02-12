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
    func search(withKeyword keyword: String)
}

enum MovieListInteractorOutput {
    case setLoading(Bool)
    case showMovies(Void)
}

protocol MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput)
}

// MARK: - Presenter

protocol MovieListPresenterProtocol: BasePresentProtocol {
    func load()
    func search(withKeyword keyword: String)
}

enum MovieListPresenterOutput {
    case setLoading(Bool)
    case showMovies(Void)
}

// MARK: - Router

enum MovieListRoute {
    case detail
}

protocol MovieListRouterProtocol: class {
    func navigate(to route: MovieListRoute)
}

// MARK: - View

protocol MovieListViewProtocol: class {
    func handleOutput(_ output: MovieListPresenterOutput)
}
