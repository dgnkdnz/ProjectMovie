//
//  MovieListCollectionViewCell.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

class MovieListCollectionViewCell: BaseCollectionViewCell<MovieListPresentation> {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
    }
    
    // MARK: - View Methods
    
    override func configure(presentation: MovieListPresentation,
                            collectionViewLayout: CollectionViewLayouts) {
        super.configure(presentation: presentation, collectionViewLayout: collectionViewLayout)
        self.movieTitleLabel.text = presentation.title
        self.favoriteImageView.alpha = presentation.isFavorite ? 1 : 0
        switch collectionViewLayout {
        case .oneColumn:
            UIView.transition(with: self.imageView,
                              duration: 0.2,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.setImage(withUrl: presentation.backdropPath) },
                              completion: nil)
        case .twoColumn:
            UIView.transition(with: self.imageView,
                              duration: 0.2,
                              options: .transitionCrossDissolve,
                              animations: { self.imageView.setImage(withUrl: presentation.posterPath) },
                              completion: nil)
        }
    }
}
