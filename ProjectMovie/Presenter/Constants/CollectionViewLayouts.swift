//
//  Layouts.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

public enum CollectionViewLayouts {
    case oneColumn
    case twoColumn
    
    func getLayout(withFlowLayout flowLayout: UICollectionViewFlowLayout?,
                   collectionViewWidth width: CGFloat) -> UICollectionViewFlowLayout {
        switch self {
        case .oneColumn:
            return getLayoutOfOneColumn(withFlowLayout: flowLayout, collectionViewWidth: width)
        case .twoColumn:
            return getLayoutOfTwoColumn(withFlowLayout: flowLayout, collectionViewWidth: width)
        }
    }
    
    private func getLayoutOfTwoColumn(withFlowLayout flowLayout: UICollectionViewFlowLayout?,
                                      collectionViewWidth width: CGFloat) -> UICollectionViewFlowLayout {
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let itemSize = (width - space) / 2
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = flowLayout?.sectionInset ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = flowLayout?.minimumInteritemSpacing ?? 0.0
        layout.itemSize = CGSize(width: itemSize, height: itemSize * 1.50)
        return layout
    }
    
    private func getLayoutOfOneColumn(withFlowLayout flowLayout: UICollectionViewFlowLayout?,
                                      collectionViewWidth width: CGFloat) -> UICollectionViewFlowLayout {
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let itemSize = width - space
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = flowLayout?.sectionInset ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = flowLayout?.minimumInteritemSpacing ?? 0.0
        layout.itemSize = CGSize(width: itemSize, height: itemSize / 1.76)
        return layout
    }
}
