//
//  MovieDetailViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieDetailViewController: BaseViewController<MovieDetailPresenter>, MovieDetailViewProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var voteCountLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Private Variables
    
    private var movie: MovieDetailPresentation?

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.load()
    }
    
    // MARK: - MovieDetailViewProtocol Methods
    
    func handleOutput(_ output: MovieDetailPresenterOutput) {
        switch output {
        case .showMovieDetail(let movie):
            self.movie = movie
            self.setControls(movie)
        default:
            break
        }
    }
    
    // MARK: - IBActions
    
    @IBAction private func closeBtnTapped(_ sender: UIButton!) {
        self.presenter.goBack()
    }
    
    @IBAction private func favoriteBtnTapped(_ sender: UIButton!) {
        #warning("to do")
    }
    
    // MARK: - Helper Methods
    
    private func setControls(_ movie: MovieDetailPresentation) {
        self.titleLabel.text = movie.title
        self.overviewLabel.text = movie.overview
        self.voteCountLabel.text = movie.voteCount
        self.imageView.setImage(withUrl: movie.imageUrl)
    }
}
