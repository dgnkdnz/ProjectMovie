//
//  MovieDetailViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieDetailViewController: BaseViewController<MovieDetailPresenter>, MovieDetailViewProtocol {

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - MovieDetailViewProtocol Methods
    
    func handleOutput(_ output: MovieDetailPresenterOutput) {
        #warning("to do")
    }
}
