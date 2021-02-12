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
    
    init(view: MovieDetailViewProtocol,
         interactor: MovieDetailInteractorProtocol,
         router: MovieDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func load() {
        #warning("to do")
    }
}
