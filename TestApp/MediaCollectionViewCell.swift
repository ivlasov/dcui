//
//  MediaCollectionViewCell.swift
//  MPUI
//
//  Created by Igor Danich on 04/11/2016.
//  Copyright © 2016 Igor Danich. All rights reserved.
//

import MPUI

class MediaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mediaView: MediaView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mediaView.contentMode = .scaleAspectFit
        mediaView.defaultImage = UIImageDraw(mediaView.size) { (size, _) in
            UIColorRandom().setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height)).fill()
        }
    }
    
}
