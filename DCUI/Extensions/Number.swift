//
//  Number.swift
//  MPUI
//
//  Created by Igor Danich on 20.01.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit
import DCFoundation

public extension Int {
    
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    
}

public extension Double {
    
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    
}

public extension CGFloat {
    
    public func toInt() -> Int {
        return Int(self)
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
    
}

// MARK: - Operator +

public func + (lhs: CGFloat, rhs: Int) -> CGFloat {
    return (CGFloat(rhs) + lhs)
}

public func + (lhs: CGFloat, rhs: Double) -> CGFloat {
    return (CGFloat(rhs) + lhs)
}

public func + (lhs: Int, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) + rhs)
}

public func + (lhs: Double, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) + rhs)
}

// MARK: - Operator -

public func - (lhs: CGFloat, rhs: Double) -> CGFloat {
    return (lhs - CGFloat(rhs))
}

// MARK: - Operator *

public func * (lhs: Int, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) * rhs)
}

public func * (lhs: Double, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) * rhs)
}

public func * (lhs: CGFloat, rhs: Int) -> CGFloat {
    return (CGFloat(rhs) * lhs)
}

public func * (lhs: CGFloat, rhs: Double) -> CGFloat {
    return (CGFloat(rhs) * lhs)
}

// MARK: - Operator /

public func / (lhs: Int, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) / rhs)
}

public func / (lhs: Double, rhs: CGFloat) -> CGFloat {
    return (CGFloat(lhs) / rhs)
}

public func / (lhs: CGFloat, rhs: Int) -> CGFloat {
    return (lhs / CGFloat(rhs))
}

public func / (lhs: CGFloat, rhs: Double) -> CGFloat {
    return (lhs / CGFloat(rhs))
}

