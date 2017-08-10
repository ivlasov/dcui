//
//  Button.swift
//  MPUI
//
//  Created by Igor Danich on 07.01.16.
//  Copyright © 2016 Igor Danich. All rights reserved.
//

import UIKit
import DCFoundation

class ButtonActionView: NSObject {
    weak var view: UIView?
    var state = UIControlState()
    
    init(view: UIView, state: UIControlState) {
        self.view = view
        self.state = state
    }
    
    func perform(_ state: UIControlState) {
        if state == state {
            if let view = view as? UILabel {
                switch state {
                case UIControlState():
                    view.isHighlighted = false
                case UIControlState.highlighted:
                    view.isHighlighted = true
                default: break
                }
            }
        }
    }
    
}

@IBDesignable
open class Button: UIButton {
    
    @IBInspectable var color: UIColor? {
        get {
            return color(for: UIControlState())
        }
        set {
            set(color: newValue, forState: UIControlState())
        }
    }
    
    @IBInspectable var highlightedColor: UIColor? {
        get {
            return color(for: UIControlState())
        }
        set {
            set(color: newValue, forState: .highlighted)
        }
    }
    
    @IBInspectable var disabledColor: UIColor? {
        get {
            return color(for: UIControlState())
        }
        set {
            set(color: newValue, forState: .disabled)
        }
    }
    
    @IBInspectable var selectedColor: UIColor? {
        get {
            return color(for: UIControlState())
        }
        set {
            set(color: newValue, forState: .selected)
        }
    }
    
    fileprivate var aCornerRadius: CGFloat = 0.0
    @IBInspectable open override var cornerRadius: CGFloat {
        get {
            return aCornerRadius
        }
        set {
            aCornerRadius = newValue
            updateButtonColor()
        }
    }
    
    fileprivate var aBorderColor: UIColor?
    @IBInspectable open override var borderColor: UIColor? {
        get {
            return aBorderColor
        }
        set {
            aBorderColor = newValue
            updateButtonColor()
        }
    }
    
    fileprivate var aBorderWidth: CGFloat = 0.0
    @IBInspectable open override var borderWidth: CGFloat {
        get {
            return aBorderWidth
        }
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
                super.setBackgroundImage(UIImage.draw(size: size, handler: { (size, context) in
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
        if size == CGSize.zero || lastSize == size {
            return
        }
        lastSize = size
        updateButtonColor()
    }
    
    @IBOutlet open var actionViewsForHighlight: [UIView]? {
        didSet {
            if let list = actionViewsForHighlight {
                for item in list {
                    addActionView(item, state: .highlighted)
                }
            }
        }
    }
    
    lazy fileprivate var actionViews = [ButtonActionView]()
    
    open func addActionView(_ view: UIView, state: UIControlState) {
        actionViews << ButtonActionView(view: view, state: state)
        removeActionView(nil)
    }
    
    open func removeActionView(_ view: UIView?, state: UIControlState? = nil) {
        var remove = [ButtonActionView]()
        for action in actionViews {
            if action.view == view {
                if let state = state {
                    if action.state == state {
                        remove << action
                    }
                } else {
                    remove << action
                }
            } else if action.view == nil {
                remove << action
            }
        }
        for item in remove {
            if let index = actionViews.index(of: item) {
                actionViews.remove(at: index)
            }
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            performActionForViews()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            performActionForViews()
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            performActionForViews()
        }
    }
    
    fileprivate func performActionForViews() {
//        for item in actionViews {
//            item.perform(state)
//        }
    }
    
    open override func styleProperty(key: String, value: AnyObject?) -> AnyObject? {
        if key == "color" {
            return (value as? String)?.toUIColor()
        }
        return super.styleProperty(key: key, value: value)
    }
    
}

//func <<-->> (button: Button, view: UIView) {
//    button.addActionView(view, state: .highlighted)
//}
//
//func <<-->> (button: Button, right: (view: UIView, state: UIControlState)) {
//    button.addActionView(right.view, state: right.state)
//}
