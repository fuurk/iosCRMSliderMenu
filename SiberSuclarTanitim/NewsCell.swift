//
//  HaberCell.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 27.11.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
   
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    var id: Int!
    
    func setImage(imageName: String) {
        newsImage?.image = UIImage(named: imageName)
        newsImage?.setNeedsDisplay()
    }
    
    func setImageReal(image: UIImage){
        newsImage?.image = image
        newsImage?.setNeedsDisplay()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}
