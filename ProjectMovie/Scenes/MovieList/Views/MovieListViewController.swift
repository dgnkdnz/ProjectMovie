//
//  MovieListViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

class MovieListViewController: BaseViewController<MovieListPresenter>, MovieListViewProtocol {
    
    // MARK: - IBOutlets
    
    // MARK: - Private Variables
    
    // MARK: - Public Variables

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - MovieListViewProtocol Methods
    
    func handleOutput(_ output: MovieListPresenterOutput) {
        #warning("to do")
    }
    
    // MARK: - Helper Methods
}
