//
//  ImageCache.swift
//  RocketBall
//
//  Created by Igor Danich on 05.02.16.
//  Copyright © 2016 Igor Danich. All rights reserved.
//

import Foundation

open class CacheImageConverter: CacheConverter {
    
    public enum `Type`: String {
        case PNG
        case JPEG
    }
    open fileprivate(set) var type   : Type = Type.PNG
    open fileprivate(set) var scale  : CGFloat = UIScreen.main.scale
    
    public init() {
        type = .PNG
        scale = UIScreen.main.scale
    }
    
    public init(type: Type, scale: CGFloat = UIScreen.main.scale) {
        self.type = type
        self.scale = scale
    }
    
    open func object(from data: Data?) -> Any? {
        guard let data = data else {return nil}
        return UIImage(data: data, scale: scale)
    }
    
    open func data(from object: Any?) -> Data? {
        if let object = object as? Data {return object}
        guard let object = object as? UIImage else {return nil}
        switch type {
        case .PNG:
            return UIImagePNGRepresentation(object)
        case .JPEG:
            return UIImageJPEGRepresentation(object, 1)
        }
    }
    
}
