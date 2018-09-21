//
//  Style.swift
//  TX2
//
//  Created by Igor Danich on 19.05.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

open class Style {
    
    static fileprivate var styles = [Style]()
    
    public static func preload(path: String) {
        guard let info = NSDictionary(contentsOfFile: path) as? [String:AnyObject] else {return}
        styles = []
        guard let list = info["items"] as? [[String:AnyObject]] else {return}
        for item in list {
            styles << Style(info: item)
        }
        UIApplication.shared.applyStyle()
    }
    
    public static func `for`(object: NSObject) -> Style? {
        if let name = object.styleName {
            for item in styles {
                if item.name == name {
                    return item
                }
            }
        } else {
            for item in styles {
                if item.className == NSStringFromClass(object.classForCoder).components(separatedBy: ".").last {
                    return item
                }
            }
        }
        return nil
    }
    
    open var name: String?
    open var className: String?
    open var properties = [String:AnyObject]()
    
    public init(info: [String:AnyObject]) {
        name = info["name"] as? String
        className = info["class"] as? String
        if let properties = info["properties"] as? [String:AnyObject] {
            self.properties = properties
        }
    }
    
}
