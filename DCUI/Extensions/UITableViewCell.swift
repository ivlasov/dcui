//
//  UITableViewCell.swift
//  TX2
//
//  Created by Igor Danich on 27.01.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import Foundation

public extension UITableViewCell {
    
    static func cellId() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public convenience init(reuseIdentifier: String?) {
        self.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
    }
        
    public class func cellHeight() -> CGFloat {
        return 44.0
    }
    
    public static func cell<T:UITableViewCell>(xibName: String? = nil) -> T? {
        var xib: String! = xibName
        if xib == nil {
            xib = NSStringFromClass(self).components(separatedBy: ".").last
        }
        if let _ = Bundle.main.path(forResource: xib, ofType: nil) {
            for item in UINib(nibName: xib, bundle: nil).instantiate(withOwner: nil, options: nil) {
                if let item = item as? T {
                    return item
                }
            }
        }
        return nil
    }
    
}
