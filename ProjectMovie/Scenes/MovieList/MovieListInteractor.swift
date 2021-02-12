//
//  MovieListInteractor.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - Private Variables
    
    private let service: MovieServiceProtocol
    private var popularMovies: PopularMovies?
    
    // MARK: - Public Variables
    
    var delegate: MovieListInteractorDelegate?
    
    // MARK: - Initialization Methods
    
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    // MARK: - Interactor Methods
    
    func load() {
        self.fetchMovies(withPage: 1)
    }
    
    func search(withKeyword keyword: String) {
        #warning("to do")
    }
    
    // MARK: - Helper Methods
    
    private func fetchMovies(withPage page: Int) {
        self.service.fetchPopularMovies(page: page) { [weak self] result in
            switch result {
            case .success(let popularMovies):
                self?.popularMovies = popularMovies
                DispatchQueue.main.async {
                    self?.delegate?.handleOutput(.showMovies(popularMovies))
                }
                break
            case .failure(let error):
                break
            }
        }
    }
}
