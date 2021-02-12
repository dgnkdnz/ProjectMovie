//
//  BaseCollectionViewCell.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

open class BaseCollectionViewCell<T: BasePresentationProtocol>: UICollectionViewCell {
    open func configure(presentation: T) {
    }
}
