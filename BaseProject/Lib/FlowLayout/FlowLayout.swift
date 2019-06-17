//
//  FlowLayout.swift
//  BaseProject
//
//  Created by Macbook on 6/13/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        self.minimumInteritemSpacing = 16
        self.minimumLineSpacing = 16
        self.sectionInset = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
        self.scrollDirection = .horizontal
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let layoutAttributes = super.layoutAttributesForItem(at: indexPath) else { return nil }
        guard let collectionView = collectionView else { return nil }
        if #available(iOS 11.0, *) {
            layoutAttributes.bounds.size.height = collectionView.safeAreaLayoutGuide.layoutFrame.height - sectionInset.top - sectionInset.bottom
        } else {
            layoutAttributes.bounds.size.height = collectionView.frame.size.height - sectionInset.top - sectionInset.bottom
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let layoutAttributes = super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath) else { return nil }
        guard let collectionView = collectionView else { return nil }
        if #available(iOS 11.0, *) {
            layoutAttributes.bounds.size.height = collectionView.safeAreaLayoutGuide.layoutFrame.height - sectionInset.top - sectionInset.bottom
        } else {
            layoutAttributes.bounds.size.height = collectionView.frame.size.height - sectionInset.top - sectionInset.bottom
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superLayoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        guard scrollDirection == .horizontal else { return superLayoutAttributes }
        
        let computedAttributes = superLayoutAttributes.compactMap { layoutAttribute in
            return layoutAttribute.representedElementCategory == .cell ? layoutAttributesForItem(at: layoutAttribute.indexPath) : layoutAttributesForSupplementaryView(ofKind: layoutAttribute.representedElementKind!, at: layoutAttribute.indexPath)
        }
        return computedAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
