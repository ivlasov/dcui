//
//  UIViewCache.swift
//  MPLibrary
//
//  Created by Igor Danich on 16.08.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import DCFoundation

class UIViewCache {
    
    static let shared = UIViewCache()
    
    fileprivate var views = [String:[UIView]]()
    
    func dequeueReusableView<T:UIView>(_ name: String, identifier: String? = nil) -> T? {
        if let views = views[name] {
            for view in views {
                guard let view = view as? T else {continue}
                if view.superview == nil {
                    if let identifier = identifier {
                        if view.identifier == identifier {
                            return view
                        }
                    } else {
                        return view
                    }
                }
            }
        }
        return nil
    }
    
    func trackView(_ view: UIView) {
        let cache = NSStringFromClass(view.classForCoder)
        if var views = views[cache] {
            views << view
        } else {
            views[cache] = [view]
        }
    }
    
}
