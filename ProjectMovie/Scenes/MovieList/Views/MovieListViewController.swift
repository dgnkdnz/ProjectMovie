//
//  MovieListViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

class MovieListViewController: BaseViewController<MovieListPresenter>, MovieListViewProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    
    private let collectionViewCellNibName: String = "MovieListCollectionViewCell"
    private let collectionViewCellReuseIdentifier: String = "MovieListCollectionViewCell"
    private var movies: [MovieListPresentation]!
    
    // MARK: - Public Variables

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.load()
    }
    
    // MARK: - Initialization Methods
    
    override func prepare() {
        super.prepare()
        
        // Configure local variables
        self.movies = []
        
        // Configure Collection View
        self.collectionView.register(UINib(nibName: collectionViewCellNibName, bundle: nil),
                                     forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - MovieListViewProtocol Methods
    
    func handleOutput(_ output: MovieListPresenterOutput) {
        switch output {
        case .showMovies(let movieListPresentations):
            self.movies = movieListPresentations
            self.collectionView.reloadData()
        default:
            break
        }
    }
    
    // MARK: - Helper Methods
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier,
                                                          for: indexPath) as? MovieListCollectionViewCell,
            let movies = self.movies
        else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.row]
        cell.configure(presentation: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (self.collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size * 1.50)
    }
}
