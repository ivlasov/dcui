//
//  UIApplication.swift
//  MPUI
//
//  Created by Igor on 08.12.15.
//  Copyright © 2015 dclife. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            open(url)
        }
    }
    
}
