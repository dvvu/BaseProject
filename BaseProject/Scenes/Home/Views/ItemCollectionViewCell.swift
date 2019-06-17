//
//  ItemCollectionViewCell.swift
//  BaseProject
//
//  Created by Macbook on 6/13/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var backgroundTitleView: UIView!
    private var width: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(item: ItemViewModel) {
        itemTitleLabel.text = item.keywordText
        backgroundTitleView.backgroundColor = item.color
        width = item.widthCell > 150 ? item.widthCell : 150
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        itemTitleLabel.preferredMaxLayoutWidth = width
        layoutAttributes.bounds.size.width = width
        return layoutAttributes
    }
}
