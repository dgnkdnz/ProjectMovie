//
//  MovieListPresenter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    
    // MARK: - Private Variables
    
    private weak var view: MovieListViewProtocol?
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    private var movies: [Movie]?
    private var filteredMovies: [Movie]?
    private var lastSelectedIndex: Int?
    
    // MARK: - Initialization Methods
    
    init(view: MovieListViewProtocol,
         interactor: MovieListInteractorProtocol,
         router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    // MARK: Presenter Methods
    
    func load() {
        self.interactor.load()
    }
    
    func loadMore() {
        self.interactor.loadMore()
    }
    
    func reloadMovie() {
        guard
            let selectedIndex = self.lastSelectedIndex,
            var movies = self.movies
        else {
            return
        }
        
        if self.filteredMovies != nil && !self.filteredMovies!.isEmpty {
            self.filteredMovies![selectedIndex].isFavorite = UserDefaultsService.shared.any(withId: self.filteredMovies![selectedIndex].id)
            let presentations = self.filteredMovies!.map({ MovieListPresentation(movie: $0) })
            self.view?.handleOutput(.showMovies(presentations))
        } else {
            movies[selectedIndex].isFavorite = UserDefaultsService.shared.any(withId: movies[selectedIndex].id)
            let presentations = movies.map({ MovieListPresentation(movie: $0) })
            self.view?.handleOutput(.showMovies(presentations))
        }
    }
    
    func movieDetail(withIndex index: Int) {
        self.lastSelectedIndex = index
        if let filteredMovies = self.filteredMovies, !filteredMovies.isEmpty {
            self.interactor.movieDetail(withMovieId: filteredMovies[index].id)
            return
        }
        
        if let movies = self.movies, !movies.isEmpty {
            self.interactor.movieDetail(withMovieId:  movies[index].id)
            return
        }
    }
    
    func search(withKeyword keyword: String) {
        guard let movies = self.movies else { return }
        
        if keyword.count == 0 {
            self.filteredMovies = []
            let movieListPresentations = movies.map({ MovieListPresentation(movie: $0) })
            self.view?.handleOutput(.showMovies(movieListPresentations))
            return
        }
        
        self.filteredMovies = movies.filter({
            $0.title.lowercased().contains(keyword.lowercased()) ||
            $0.originalTitle.lowercased().contains(keyword.lowercased())
        })
        let movieListPresentations = self.filteredMovies!.map({ MovieListPresentation(movie: $0) })
        self.view?.handleOutput(.showMovies(movieListPresentations))
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .showMovies(let movies):
            if self.movies != nil && !self.movies!.isEmpty {
                self.movies?.append(contentsOf: movies)
            } else {
                self.movies = movies
            }
            let movieListPresentations = self.movies!.map({ MovieListPresentation(movie: $0) })
            self.view?.handleOutput(.showMovies(movieListPresentations))
        case .showMovieDetail(let movie):
            self.router.navigate(to: .detail(movie))
            break
        default:
            break
        }
    }
}
