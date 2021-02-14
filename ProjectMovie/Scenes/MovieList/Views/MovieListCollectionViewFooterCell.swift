//
//  MovieListCollectionViewFooterCell.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

typealias LoadMoreTappedHandler = () -> Void

final class MovieListCollectionViewFooterCell: UICollectionReusableView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var loadMoreButton: BaseButton!
    
    // MARK: - Private Variables
    
    private var handler: LoadMoreTappedHandler?
    
    func configure(loadMoreTappedHandler handler: @escaping LoadMoreTappedHandler) {
        self.handler = handler
    }
    
    // MARK: - IBActions
    
    @IBAction private func loadMoreBtnTapped(_ sender: UIButton!) {
        self.handler?()
    }
}

