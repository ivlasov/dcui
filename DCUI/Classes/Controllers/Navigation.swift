//
//  Navigation.swift
//  BGov
//
//  Created by Igor Danich on 01.08.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    fileprivate struct NavigationControllerExtraKeys {
        static var useNavigationRules = "useNavigationRules"
    }
    
    @IBInspectable var useNavigationRules: Bool {
        get {
            if let value: Bool = RuntimeGetAssociatedObject(self, key: &NavigationControllerExtraKeys.useNavigationRules) {
                return value
            }
            return false
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &NavigationControllerExtraKeys.useNavigationRules)
        }
    }
    
}

public extension UIViewController {
    
    fileprivate struct ViewControllerNavigationKeys {
        static var navigationBarTintColor = "navigationBarTintColor"
        static var clearBackButtonTitle = "clearBackButtonTitle"
        static var navigationBarHidden = "navigationBarHidden"
        static var navigationBarCleared = "navigationBarCleared"
        static var useNavigationRules = "useNavigationRules"
    }
    
    @IBInspectable var navigationBarTintColor: UIColor? {
        get {
            return RuntimeGetAssociatedObject(self, key: &ViewControllerNavigationKeys.navigationBarTintColor)
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &ViewControllerNavigationKeys.navigationBarTintColor)
        }
    }
    
    @IBInspectable var clearBackButtonTitle: Bool {
        get {
            if let value: Bool = RuntimeGetAssociatedObject(self, key: &ViewControllerNavigationKeys.clearBackButtonTitle) {
                return value
            }
            return false
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &ViewControllerNavigationKeys.clearBackButtonTitle)
        }
    }
    
    @IBInspectable var navigationBarHidden: Bool {
        get {
            if let value: Bool = RuntimeGetAssociatedObject(self, key: &ViewControllerNavigationKeys.navigationBarHidden) {
                return value
            }
            return false
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &ViewControllerNavigationKeys.navigationBarHidden)
        }
    }
    
    @IBInspectable var navigationBarCleared: Bool {
        get {
            if let value: Bool = RuntimeGetAssociatedObject(self, key: &ViewControllerNavigationKeys.navigationBarCleared) {
                return value
            }
            return false
        }
        set {
            RuntimeSetAssociatedObject(self, value: newValue, key: &ViewControllerNavigationKeys.navigationBarCleared)
        }
    }
    
}

public extension UINavigationController {
    
    fileprivate struct NavigationKeys {
        static var navigation = "navigation"
    }
    
    @IBOutlet var navigation: Navigation? {
        get {
            if let value: Navigation = RuntimeGetAssociatedObject(self, key: &NavigationKeys.navigation) {
                return value
            }
            return nil
        }
        set {
            newValue?.navigationController = self
            RuntimeSetAssociatedObject(self, value: newValue, key: &NavigationKeys.navigation)
        }
    }
    
}

open class Navigation: NSObject, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    
    open weak var navigationController: UINavigationController!
    
    open func handleShow(_ viewController: UIViewController, animated: Bool) {
        adjustViewController(viewController)
    }
    
    fileprivate func adjustViewController(_ ctrl: UIViewController) {
        guard navigationController.useNavigationRules else {return}
        navigationController.setNavigationBarHidden(ctrl.navigationBarHidden, animated: true)
        if ctrl.navigationBarCleared {
            navigationController.navigationBar.clear()
        } else {
            navigationController.navigationBar.reset()
        }
        if let color = ctrl.navigationBarTintColor {
            navigationController.navigationBar.tintColor = color
        } else {
            navigationController.navigationBar.tintColor = UINavigationBar.appearance().tintColor
        }
        if ctrl.clearBackButtonTitle || navigationController.clearBackButtonTitle {
            ctrl.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        }
    }
    
    // MARK: - UINavigationControllerDelegate
    
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        handleShow(viewController, animated: animated)
    }
    
    open func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationControllerOperation,
        from fromVC: UIViewController,
        to toVC: UIViewController
        ) -> UIViewControllerAnimatedTransitioning? {
        if let animation = navigationController.viewControllers.last?.transitioningAnimation {
            if animation == "default" {
                return nil
            } else {
                return TransitionAnimation.animationForKey(animation)
            }
        } else {
            return navigationController.transitioningController.navigationAnimation(operation)
        }
    }
    
}
