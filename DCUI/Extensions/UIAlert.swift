//
//  Alert.swift
//  MPUI
//
//  Created by Igor on 08.12.15.
//  Copyright © 2015 dclife. All rights reserved.
//

import UIKit

fileprivate func FindWindow() -> UIWindow? {
    var window: UIWindow?
    for item in UIApplication.shared.windows {
        if  !NSStringFromClass(item.classForCoder).contains("UIRemoteKeyboardWindow") &&
            !NSStringFromClass(item.classForCoder).contains("_UIInteractiveHighlightEffectWindow") &&
            !NSStringFromClass(item.classForCoder).contains("UITextEffectsWindow") {
            window = item
        }
    }
    return window
}

public func ShowLocalizedAlert(text: String?, inViewController: UIViewController? = nil) {
    var ctrl = inViewController
    if ctrl == nil {
        ctrl = FindWindow()?.rootViewController
    }
    if let ctrl = ctrl {
        let alert = UIAlertController(title: nil, message: text?.localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "general.button.ok".localized, style: .cancel, handler: { _ in}))
        ctrl.present(alert, animated: true, completion: nil)
    }
    
}

public func ShowLocalizedAlert(text: String?, cancel: String? = nil, style: UIAlertControllerStyle, actions: [UIAlertAction], inViewController: UIViewController? = nil) {
    var ctrl = inViewController
    if ctrl == nil {
        ctrl = FindWindow()?.rootViewController
    }
    if let ctrl = ctrl {
        let alert = UIAlertController(title: nil, message: text?.localized, preferredStyle: style)
        var hasCancel = false
        for item in actions {
            if item.style == .cancel {
                hasCancel = true
            }
            alert.addAction(item)
        }
        if !hasCancel {
            if let cancel = cancel {
                alert.addAction(UIAlertAction(title: cancel.localized, style: .cancel, handler: { _ in}))
            }
        }
        ctrl.present(alert, animated: true, completion: nil)
    }
    
}

public func ShowLocalizedAlert(error: Error?, inViewController: UIViewController? = nil) {
    if let error = error {
        ShowLocalizedAlert(text: error.localizedDescription, inViewController: inViewController)
    }
}

public extension UIAlertAction {
    
    public convenience init(title: String?, handler: ((UIAlertAction) -> Void)?) {
        self.init(title: title?.localized, style: .default, handler: handler)
    }
}
