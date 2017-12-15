//
//  UInavigationBar.swift
//  TX2
//
//  Created by Igor Danich on 29.04.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import Foundation

public extension UINavigationBar {
    
    func reset() {
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
    }
    
    func clear() {
        setBackgroundImage(UIImage.draw(size: CGSize(width: width, height: height + 20)) { size,_ in
            UIColor.clear.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height)).fill()
        }, for: .default)
        shadowImage = UIImage.draw(size: CGSize(width: width, height: 2)) { size,_ in
            UIColor.clear.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height)).fill()
        }
    }
    
}
