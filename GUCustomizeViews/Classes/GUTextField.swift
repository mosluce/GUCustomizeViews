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
    
    @IBInspectable
    public var designedFontSize: CGFloat = 60 {
        didSet {
            updateFontSize()
        }
    }
    
    public var validated: Bool = true {
        didSet {
            if oldValue != validated {
                updateSideViews()
            }
        }
    }
    
    public override var delegate: UITextFieldDelegate? {
        didSet {
            updateSideViews()
        }
    }
    
    func updateFontSize() {
        let rate = GUView.proportionForView()
        let size = CGFloat(designedFontSize) *  rate
        self.font = self.font?.fontWithSize(size)
        
        (delegate as? GUTextFieldDelegate)?.didFontChanged?(self.font)
    }
    
    func updateColors() {
        if backgroundColor == nil {
            backgroundColor = GUColors.BlueGrey800.colorWithAlphaComponent(0.1)
        }
    }
    
    func updateSideViews()  {
        let delegate = self.delegate as? GUTextFieldDelegate
        let leftView = delegate?.viewForLeftView()
        let rightView = delegate?.viewForRightView()
        let rightErrView = delegate?.viewForRightErrorView()
        
        //Left
        if let leftView = leftView {
            self.leftViewMode = .Always
            self.leftView = leftView
        }
        
        //Right
        self.rightViewMode = .Never
        
        if let rightView = rightView {
            if validated {
                self.rightViewMode = .Always
                self.rightView = rightView
            }
        }
        
        if let rightErrView = rightErrView {
            if !validated {
                self.rightViewMode = .Always
                self.rightView = rightErrView
            }
        }
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateFontSize()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.height / 2
        self.borderStyle = .None
        
        updateFontSize()
        updateColors()
    }
    
    public override func textRectForBounds(bounds: CGRect) -> CGRect {
        var left = bounds.height / 2, right = bounds.height / 2
        
        if self.rightView != nil {
            right = rightViewRectForBounds(bounds).width
        }
        
        if self.leftView != nil {
            left = leftViewRectForBounds(bounds).width
        }
        
        return CGRectMake(left, 0, bounds.width-(left+right), bounds.height )
    }
    
    public override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    public override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        return (delegate as! GUTextFieldDelegate).frameForLeftView(bounds)
    }
    
    public override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        if validated {
            return (delegate as! GUTextFieldDelegate).frameForRightView(bounds)
        } else {
            return (delegate as! GUTextFieldDelegate).frameForRightErrorView(bounds)
        }
    }
}

@objc public protocol GUTextFieldDelegate: UITextFieldDelegate {
    func viewForLeftView() -> UIView?
    func frameForLeftView(bounds: CGRect) -> CGRect
    
    func viewForRightView() -> UIView?
    func frameForRightView(bounds: CGRect) -> CGRect
    
    func viewForRightErrorView() -> UIView?
    func frameForRightErrorView(bounds: CGRect) -> CGRect
    
    optional
    func didFontChanged(font: UIFont?)
}
