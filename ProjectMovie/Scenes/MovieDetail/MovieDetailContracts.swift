//
//  MovieDetailContracts.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

// MARK: - Interactor

protocol MovieDetailInteractorProtocol: class {
    var delegate: MovieDetailInteractorDelegate? { get set }
    func load()
}

enum MovieDetailInteractorOutput {
    case setLoading(Bool)
}

protocol MovieDetailInteractorDelegate {
    func handleOutput(_ output: MovieDetailInteractorOutput)
}

// MARK: - Presenter

protocol MovieDetailPresenterProtocol: BasePresentProtocol {
    func load()
}

enum MovieDetailPresenterOutput {
    case setLoading(Bool)
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
