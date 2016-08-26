//
//  GUTextField.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/23.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
public class GUTextField: UITextField {
    private var tfdelegate: GUTextFieldDelegate?
    
    @IBInspectable public var designedFontSize: CGFloat = 60 {
        didSet {
            updateFontSize()
        }
    }
    
    @IBInspectable public var designedFontName: String = "PingFangTC-Semibold" {
        didSet {
            updateFontSize()
        }
    }
    
    public var invalid: Bool = false {
        didSet {
            updateSideViews()
        }
    }
    
    public override var delegate: UITextFieldDelegate? {
        didSet {
            tfdelegate = delegate as? GUTextFieldDelegate
            
            updateSideViews()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    //初始化寫這裡不需要 override 兩個 init
    func commonInit() {
        //TODO: write initialize codes
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        updateSideViews()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.borderStyle = .None
        self.backgroundColor = GUColors.BlueGrey800.colorWithAlphaComponent(0.1)
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    public override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        
        if validateDelegate(#selector(GUTextFieldDelegate.rectForLeftView(_:))) {
            return tfdelegate!.rectForLeftView!(bounds)
        }
        
        return CGRectZero
    }
    
    public override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        
        if !invalid {
            if validateDelegate(#selector(GUTextFieldDelegate.rectForRightView(_:))) {
                return tfdelegate!.rectForRightView!(bounds)
            }
        } else {
            if validateDelegate(#selector(GUTextFieldDelegate.rectForRightErrorView(_:))) {
                return tfdelegate!.rectForRightErrorView!(bounds)
            }
        }
        
        return CGRectZero
    }
    
    public override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    public override func textRectForBounds(bounds: CGRect) -> CGRect {
        var left = leftViewRectForBounds(bounds).width
        var right = rightViewRectForBounds(bounds).width
        
        if left == 0 {
            left = bounds.height / 2
        }
        
        if right == 0 {
            right = bounds.height / 2
        }
        
        return CGRectMake(left, 0, bounds.width-(left+right), bounds.height)
    }
    
    func validateDelegate(selector: Selector) -> Bool {
        guard let delegate = tfdelegate else {
            return false
        }
        
        if !delegate.respondsToSelector(selector) {
            return false
        }
        
        return true
    }
    
    func updateSideViews() {
        leftView = tfdelegate?.viewForLeftView?()
        
        if invalid {
            rightView = tfdelegate?.viewForRightErrorView?()
        } else {
            rightView = tfdelegate?.viewForRightView?()
        }
        
        if leftView != nil {
            leftViewMode = .Always
        } else {
            leftViewMode = .Never
        }
        
        if rightView != nil {
            rightViewMode = .Always
        } else {
            rightViewMode = .Never
        }
    }
    
    func updateFontSize() {
        if let font = UIFont(name: designedFontName, size: designedFontSize * proportionForView()) {
            self.font = font
        }
    }
}

@objc
public protocol GUTextFieldDelegate: UITextFieldDelegate {
    
    optional func viewForLeftView() -> UIView
    optional func rectForLeftView(bounds: CGRect) -> CGRect
    optional func viewForRightView() -> UIView
    optional func rectForRightView(bounds: CGRect) -> CGRect
    optional func viewForRightErrorView() -> UIView
    optional func rectForRightErrorView(bounds: CGRect) -> CGRect
    optional func didFontChanged(font: UIFont?)
}
