//
//  TransitionAnimation.swift
//  TX2
//
//  Created by Igor Danich on 03.02.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

public extension UIViewControllerContextTransitioning {
    
    public var fromViewController: UIViewController! {
        return self.viewController(forKey: UITransitionContextViewControllerKey.from)
    }
    
    public var toViewController: UIViewController! {
        return self.viewController(forKey: UITransitionContextViewControllerKey.to)
    }
    
    public var fromView: UIView! {
        return self.view(forKey: UITransitionContextViewKey.from)
    }
    
    public var toView: UIView! {
        return self.view(forKey: UITransitionContextViewKey.to)
    }
    
}

open class TransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    static var transitionAnimations = [TransitionAnimation]()
    static var defaultAnimations: [TransitionAnimation] = [
        TransitionFade()
    ]
    
    open static func registerAnimation(_ animation: TransitionAnimation) {
        transitionAnimations << animation
    }
    
    static func animationForKey(_ key: String?) -> TransitionAnimation? {
        guard let key = key else {
            return nil
        }
        for animation in transitionAnimations {
            if animation.name == key {
                return animation
            }
        }
        for animation in defaultAnimations {
            if animation.name == key {
                return animation
            }
        }
        return nil
    }
    
    public enum AnimationType {
        case none
        case push
        case pop
    }
    
    open var type = AnimationType.push
    
    open var navigationOperation: UINavigationControllerOperation {
        get {
            switch type {
            case .push: return .push
            case .pop:  return .pop
            default:    return .none
            }
        }
        set {
            switch newValue {
            case .pop:  self.type = .pop
            case .push: self.type = .push
            case .none: self.type = .none
            }
        }
    }
    open var animationDuration: TimeInterval = 0.3
    
    open var name: String {
        return NSStringFromClass(self.classForCoder)
    }
    
    public override init() {
        super.init()
    }
    
    public init(type: AnimationType) {
        self.type = type
        super.init()
    }
    
    open func prepare() {
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.animationDuration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    }
    
}
