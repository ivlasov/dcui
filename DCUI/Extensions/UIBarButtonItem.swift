//
//  UIBarButtonItem.swift
//  TX2
//
//  Created by Igor Danich on 26.01.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    fileprivate struct Keys {
        static var buttonHandler = "buttonHandler"
    }
    
    public convenience init(title: String, target: AnyObject?, action: Selector) {
        self.init(title: title, style: .done, target: target, action: action)
    }
    
    var buttonHandler: ((UIBarButtonItem) -> Void)? {
        get {
            return RuntimeGetAssociatedObject(self, key: &Keys.buttonHandler)
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &Keys.buttonHandler)
        }
    }
    
    public convenience init(title: String, handler: ((UIBarButtonItem) -> Void)?) {
        self.init(title: title, style: .done, target: nil, action: nil)
        buttonHandler = handler
        target = self
        action = #selector(UIBarButtonItem.onAction)
    }
    
    public convenience init(image: UIImage, handler: ((UIBarButtonItem) -> Void)?) {
        self.init(image: image, style: .done, target: nil, action: nil)
        buttonHandler = handler
        target = self
        action = #selector(UIBarButtonItem.onAction)
    }
    
    func onAction() {
        buttonHandler?(self)
    }
    
}
