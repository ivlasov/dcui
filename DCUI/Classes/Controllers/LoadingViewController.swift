//
//  LoadingViewController.swift
//  TX2
//
//  Created by Igor Danich on 25.01.16.
//  Copyright © 2016 dclife. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {
    
    fileprivate var indicator: UIActivityIndicatorView!
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .overCurrentContext
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.startAnimating()
        view.addSubview(indicator)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        indicator.center = CGPoint(x: view.width/2, y: view.height/2)
    }
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}
