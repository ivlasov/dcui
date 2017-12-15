//
//  ColoredButton.swift
//  DCUI
//
//  Created by Igor Danich on 12/15/17.
//  Copyright © 2017 Igor Danich. All rights reserved.
//

import UIKit

@IBDesignable open class ColoredButton: UIButton {
    
    @IBInspectable var color: UIColor? {
        get {return color(for: UIControlState())}
        set {set(color: newValue, forState: UIControlState())}
    }
    
    @IBInspectable var highlightedColor: UIColor? {
        get {return color(for: UIControlState())}
        set {set(color: newValue, forState: .highlighted)}
    }
    
    @IBInspectable var disabledColor: UIColor? {
        get {return color(for: UIControlState())}
        set {set(color: newValue, forState: .disabled)}
    }
    
    @IBInspectable var selectedColor: UIColor? {
        get {return color(for: UIControlState())}
        set {set(color: newValue, forState: .selected)}
    }
    
    fileprivate var aCornerRadius: CGFloat = 0.0
    @IBInspectable open override var cornerRadius: CGFloat {
        get {return aCornerRadius}
        set {
            aCornerRadius = newValue
            updateButtonColor()
        }
    }
    
    fileprivate var aBorderColor: UIColor?
    @IBInspectable open override var borderColor: UIColor? {
        get {return aBorderColor}
        set {
            aBorderColor = newValue
            updateButtonColor()
        }
    }
    
    fileprivate var aBorderWidth: CGFloat = 0.0
    @IBInspectable open override var borderWidth: CGFloat {
        get {return aBorderWidth}
        set {
            aBorderWidth = newValue
            updateButtonColor()
        }
    }
    
    fileprivate var buttonColorStates = [UInt:UIColor]()
    fileprivate var buttonImagesStates = [UInt:Bool]()
    
    fileprivate var lastSize: CGSize?
    
    fileprivate func updateButtonColor() {
        if color(for: UIControlState()) == nil {
            set(color: UIColor.clear, forState: UIControlState())
        }
        for (stateIndex,color) in buttonColorStates {
            let state = UIControlState(rawValue: stateIndex)
            var exists = false
            if let value = buttonImagesStates[stateIndex] {
                exists = value
            }
            if !exists {
                super.setBackgroundImage(UIImage.draw(size: size, { (size, context) in
                    color.setFill()
                    let frame = CGRect(x: self.borderWidth/2, y: self.borderWidth/2, width: size.width - self.borderWidth, height: size.height - self.borderWidth)
                    let path = UIBezierPath(roundedRect: frame, cornerRadius: self.cornerRadius)
                    path.fill()
                    if let color = self.borderColor {
                        color.setStroke()
                        path.lineWidth = self.borderWidth
                        path.stroke()
                    }
                }), for: state)
            }
        }
    }
    
    open func set(color: UIColor?, forState state: UIControlState) {
        buttonColorStates[state.rawValue] = color
        updateButtonColor()
    }
    
    open func color(for state: UIControlState) -> UIColor? {
        return buttonColorStates[state.rawValue]
    }
    
    override open func setBackgroundImage(_ image: UIImage?, for state: UIControlState) {
        buttonImagesStates[state.rawValue] = (image != nil)
        super.setBackgroundImage(image, for: state)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if size == CGSize.zero || lastSize == size {return}
        lastSize = size
        updateButtonColor()
    }
    
    open override func styleProperty(key: String, value: AnyObject?) -> AnyObject? {
        if key == "color" {
            return (value as? String)?.toUIColor()
        }
        return super.styleProperty(key: key, value: value)
    }
    
}

