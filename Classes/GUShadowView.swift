//
//  ShadowView.swift
//  HelloDrawRect
//
//  Created by 默司 on 2016/8/16.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

@IBDesignable
public class ShadowView: UIView {
    
    public var shadowColor: UIColor! = UIColor.blackColor()
    public var shadowOffset: CGSize! = CGSizeMake(0.0, 1.0)
    public var shadowOffsetY: NSNumber! = 1.0
    public var shadowRadius: NSNumber! = 1.5
    public var shadowOpacity: NSNumber! = 0.12
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func drawRect(rect: CGRect) {
        // Drawing code
        
        self.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: self.layer.cornerRadius).CGPath
        
        self.layer.shadowOpacity = shadowOpacity.floatValue
        self.layer.shadowRadius = CGFloat(shadowRadius.floatValue)
        self.layer.shadowColor = shadowColor.CGColor
        self.layer.shadowOffset = shadowOffset
    }
    
    
}
