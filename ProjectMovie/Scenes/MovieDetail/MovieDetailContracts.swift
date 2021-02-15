//
//  MovieDetailContracts.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

// MARK: - Interactor

protocol MovieDetailInteractorProtocol: class {
    var delegate: MovieDetailInteractorDelegate? { get set }
    func load(withId id: Int)
    func favorite(withId id: Int)
}

enum MovieDetailInteractorOutput {
    case setLoading(Bool)
    case favorite(Bool)
}

protocol MovieDetailInteractorDelegate {
    func handleOutput(_ output: MovieDetailInteractorOutput)
}

// MARK: - Presenter

protocol MovieDetailPresenterProtocol: BasePresentProtocol {
    func load()
    func goBack()
    func favoriteMovie()
}

enum MovieDetailPresenterOutput {
    case setLoading(Bool)
    case showMovieDetail(MovieDetailPresentation)
    case favorite(Bool)
}

// MARK: - Router

enum MovieDetailRoute {
    case back
}

protocol MovieDetailRouterProtocol: class {
    func navigate(to route: MovieDetailRoute)
}

// MARK: - View

protocol MovieDetailViewProtocol: class {
    func handleOutput(_ output: MovieDetailPresenterOutput)
}
