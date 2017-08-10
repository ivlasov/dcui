//
//  UICollectionViewCell.swift
//  MPLibrary
//
//  Created by Igor Danich on 06.10.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import Foundation

public extension UICollectionView {
    
    public func dequeueReusableCell<T:UICollectionViewCell>(identifier: String, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
}
