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
    private var filteredMovies: [Movie]?
    
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
    
    func loadMore() {
        guard let popularMovies = self.popularMovies else { return }
        self.fetchMovies(withPage: popularMovies.page + 1)
    }
    
    func search(withKeyword keyword: String) {
        guard
            let popularMovies = self.popularMovies
        else {
            return
        }
        
        if keyword.count == 0 {
            self.delegate?.handleOutput(.showMovies(popularMovies.movies))
            return
        }
        
        self.filteredMovies = popularMovies.movies.filter({
            $0.originalTitle.lowercased().contains(keyword.lowercased()) ||
            $0.title.lowercased().contains(keyword.lowercased())
        })
        
        self.delegate?.handleOutput(.showMovies(self.filteredMovies!))
    }
    
    func movieDetail(withIndex index: Int) {
        guard let movies = self.popularMovies else { return }
        let movie = movies.movies[index]
        self.service.getMovieDetails(WithId: movie.id) { [weak self] result in
            switch result {
            case .success(let movie):
                print(movie)
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
            case .success(let popularMovies):
                if self.popularMovies == nil || self.popularMovies!.movies.isEmpty {
                    self.popularMovies = popularMovies
                } else {
                    self.popularMovies!.page = popularMovies.page
                    self.popularMovies!.movies.append(contentsOf: popularMovies.movies)
                }
                DispatchQueue.main.async {
                    self.delegate?.handleOutput(.showMovies(self.popularMovies!.movies))
                }
                break
            case .failure(let error):
                break
            }
        }
    }
}
