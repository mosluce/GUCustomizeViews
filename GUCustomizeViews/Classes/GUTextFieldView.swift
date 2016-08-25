//
//  GUTextFieldView.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/24.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
public class GUTextFieldView: GUXibView, GUTextFieldDelegate {
    
    @IBOutlet
    weak var field: GUTextField!
    @IBOutlet
    weak var bottomConstraint: NSLayoutConstraint!
    
    @IBInspectable
    public var placeholder: String? {
        didSet {
            field.placeholder = placeholder
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 6 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var buttomSpacing: Constraint!
    private let messageView: UIView = UIView()
    private let messageLabel: UILabel = UILabel()
    private let borderShapeLayer: CAShapeLayer = CAShapeLayer()
    
    override func commonInit() {
        super.commonInit()
        
        guard let contentView = contentView else { fatalError() }
        
        let rate = GUView.proportionForView()
        
        contentView.snp_makeConstraints(closure: { (make) in
            buttomSpacing = make.bottom.equalTo(self).constraint
            make.left.right.top.equalTo(self)
        })
        
        self.addSubview(messageView)
        
        messageView.addSubview(messageLabel)
        messageView.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.snp_bottom)
            make.width.equalTo(contentView).multipliedBy(0.84)
            make.centerX.equalTo(contentView)
            make.height.equalTo(contentView).multipliedBy(0.518)
        }
        
        messageLabel.font = UIFont(name: "PingFangTC-Regular", size: 44*rate)
        messageLabel.numberOfLines = 0
        messageLabel.minimumScaleFactor = 0.5
        messageLabel.textColor = GUColors.Red500
        messageLabel.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(messageView)
            make.height.equalTo(messageView).multipliedBy(0.545)
        }
        
        field.delegate = self
    }
    
    override func nibName() -> String? {
        return "GUTextFieldView"
    }
    
    //MARK: GUTextFieldDelegate
    public func viewForLeftView() -> UIView? {
        return nil
    }
    
    public func frameForLeftView(bounds: CGRect) -> CGRect {
        return CGRectZero
    }
    
    public func viewForRightView() -> UIView? {
        return nil
    }
    
    public func frameForRightView(bounds: CGRect) -> CGRect {
        return CGRectZero
    }
    
    public func viewForRightErrorView() -> UIView? {
        let image = UIImage(named: "icon_error_01@1x")
        let imageView = UIImageView(image: image)
        let view = UIView()
        
        view.addSubview(imageView)
        
        imageView.contentMode = .ScaleAspectFit
        imageView.snp_makeConstraints { (make) in
            make.size.equalTo(view).multipliedBy(0.714)
            make.center.equalTo(view)
        }
        
        return view
    }
    
    public func frameForRightErrorView(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.width - bounds.height, 0, bounds.height, bounds.height)
        //        return CGRectZero
    }
    
    public func setErrorMessage(message: String?) {
        if messageLabel.text != message {
            messageLabel.text = message
            
            if message != nil {
                buttomSpacing.updateOffset(messageView.bounds.height * -1)
                field.validated = false
            } else {
                buttomSpacing.updateOffset(0)
                field.validated = true
            }
            
            setNeedsDisplay()
        }
        
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        borderShapeLayer.removeFromSuperlayer()
        
        if messageLabel.text != nil {
            let lineWidth = borderWidth * GUView.proportionForView()
            let pathRect = CGRectInset(field.frame, lineWidth, lineWidth)
            
            borderShapeLayer.fillColor = UIColor.clearColor().CGColor
            borderShapeLayer.strokeColor = GUColors.Red500.CGColor
            borderShapeLayer.lineWidth = lineWidth
            borderShapeLayer.path = UIBezierPath(roundedRect: pathRect, cornerRadius: pathRect.height/2).CGPath
            
            self.layer.addSublayer(borderShapeLayer)
        }
    }
    
    public override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        field.becomeFirstResponder()
        
        return true
    }
    
    public override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        field.resignFirstResponder()
        
        return true
    }
}
