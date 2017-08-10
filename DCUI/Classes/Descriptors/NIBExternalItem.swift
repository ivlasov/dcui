//
//  ExternalCell.swift
//  TX2
//
//  Created by Igor Danich on 18.02.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

open class NIBExternalItem: NSObject {
    
    @IBInspectable open var className: String?
    @IBInspectable open var nibName: String?
    @IBInspectable open var reuseIdentifier: String?
    
}
