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
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }

    // MARK: - View Methods

    override func configure(presentation: MovieListPresentation) {
        super.configure(presentation: presentation)
        self.movieTitleLabel.text = presentation.title
        self.imageView.setImage(withUrl: presentation.posterPath)
    }
}
