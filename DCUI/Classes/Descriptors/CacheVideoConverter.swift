//
//  CacheVideoConverter.swift
//  MPUI
//
//  Created by Igor Danich on 04/11/2016.
//  Copyright © 2016 Igor Danich. All rights reserved.
//

import DCFoundation

public class CacheVideoConverter: CacheConverter {
    
    public init() {
    }

    public func object(from data: Data?) -> Any? {
        return data
    }
    
    public func data(from object: Any?) -> Data? {
        if let object = object as? URL {
            return object.absoluteString.data(using: .utf8)
        } else if let object = object as? String {
            return try? Data(contentsOf: URL(fileURLWithPath: object))
        } else if let object = object as? Data {
            return object
        }
        return nil
    }
    
}
