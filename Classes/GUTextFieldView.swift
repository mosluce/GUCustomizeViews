//
//  GUTextFieldView.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/26.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
public class GUTextFieldView: UIView, GUTextFieldDelegate {
    
    private var bSpacing: Constraint!
    private let messageLabel = UILabel()
    private let shape = CAShapeLayer()
    
    @IBInspectable public var fontSize: CGFloat = 60 {
        didSet {
            textField.designedFontSize = fontSize
        }
    }
    
    @IBInspectable public var fontName: String = "PingFangTC-Semibold" {
        didSet {
            textField.designedFontName = fontName
        }
    }
    
    @IBInspectable public var placeholder: String = "" {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    @IBInspectable public var textColor: UIColor = GUColors.BlueGrey800 {
        didSet {
            textField.textColor = textColor
        }
    }
    
    @IBInspectable public var errorColor: UIColor = GUColors.Red500
    @IBInspectable public var errorFontSize: CGFloat = 48
    @IBInspectable public var errorFontName: String = "PingFangTC-Regular"
    @IBInspectable public var errorLineWidth: CGFloat = 6
    @IBInspectable public var value: String? = nil {
        didSet {
            textField.text = value
        }
    }
    
    public let textField = GUTextField(frame: CGRectZero)
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    //初始化寫這裡不需要 override 兩個 init
    public func commonInit() {
        self.addSubview(textField)
        
        textField.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(textField.snp_width).multipliedBy(7.0/44.0)
            
            bSpacing = make.bottom.equalTo(self).constraint
        }
        
        textField.delegate = self
        
        self.addSubview(messageLabel)
        messageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(textField.snp_bottom).multipliedBy(1.214)
            make.width.equalTo(textField).multipliedBy(0.84)
            make.centerX.equalTo(textField)
        }
        
        //TODO: write initialize codes
    }
    
    public func setError(message: String?) {
        messageLabel.textColor = errorColor
        messageLabel.font = UIFont(name: errorFontName, size: errorFontSize*proportionForView())
        messageLabel.text = message
        
        if message != nil {
            textField.invalid = true
            bSpacing.updateOffset(0 - textField.bounds.height * 0.628)
        } else {
            textField.invalid = false
            bSpacing.updateOffset(0)
        }
        
        setNeedsDisplay()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.designedFontName = fontName
        textField.designedFontSize = fontSize
        textField.textColor = textColor
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        shape.removeFromSuperlayer()
        
        if textField.invalid {
            //更新 shape
            let lw = errorLineWidth * proportionForView()
            let rect = CGRectInset(textField.frame, lw, lw)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height/2)
            
            shape.strokeColor = errorColor.CGColor
            shape.fillColor = UIColor.clearColor().CGColor
            shape.lineWidth = lw
            shape.path = path.CGPath
            
            self.layer.addSublayer(shape)
        }
    }
}
