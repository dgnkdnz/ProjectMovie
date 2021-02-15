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
    private var popularMoviesResponse: PopularMoviesResponse?
    private let userDefaultsService: UserDefaulsServiceProtocol
    
    // MARK: - Public Variables
    
    var delegate: MovieListInteractorDelegate?
    
    // MARK: - Initialization Methods
    
    init(service: MovieServiceProtocol, userDefaultsService: UserDefaulsServiceProtocol) {
        self.service = service
        self.userDefaultsService = userDefaultsService
    }
    
    // MARK: - Interactor Methods
    
    func load() {
        self.fetchMovies(withPage: 1)
    }
    
    func loadMore() {
        guard let popularMoviesResponse = self.popularMoviesResponse else { return }
        self.fetchMovies(withPage: popularMoviesResponse.page + 1)
    }
    
    func movieDetail(withMovieId id: Int) {
        self.service.getMovieDetails(WithId: id) { [weak self] result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.delegate?.handleOutput(.showMovieDetail(movie))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Helper Methods
    
    private func fetchMovies(withPage page: Int) {
        self.service.fetchPopularMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let popularMoviesResponse):
                var movies = popularMoviesResponse.movies
                for index in movies.indices {
                    movies[index].isFavorite = self.userDefaultsService.any(withId: movies[index].id)
                }
                if self.popularMoviesResponse == nil || self.popularMoviesResponse!.movies.isEmpty {
                    self.popularMoviesResponse = popularMoviesResponse
                } else {
                    self.popularMoviesResponse!.page = popularMoviesResponse.page
                }
                DispatchQueue.main.async {
                    self.delegate?.handleOutput(.showMovies(movies))
                }
                break
            case .failure(let error):
                #warning("to do")
                break
            }
        }
    }
}
