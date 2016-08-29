//
//  MaterialShadowView.swift
//  HelloDrawRect
//
//  Created by 默司 on 2016/8/16.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
public class GUMaterialShadowView: UIView {
    
    public var depth: UInt = 1 {
        didSet {
            self.reDrawShadows()
        }
    }
    
    let topShadowView = GUShadowView()
    let bottomShadowView = GUShadowView()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    override public func prepareForInterfaceBuilder() {
        self.topShadowView.backgroundColor = self.backgroundColor
        self.bottomShadowView.backgroundColor = self.backgroundColor
    }
    
    func setup() {
        self.topShadowView.backgroundColor = self.backgroundColor
        self.bottomShadowView.backgroundColor = self.backgroundColor
        
        self.insertSubview(topShadowView, atIndex: 0)
        self.insertSubview(bottomShadowView, atIndex: 0)
        
        self.topShadowView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
        
        self.bottomShadowView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
        
        self.reDrawShadows()
    }
    
    public func reDrawShadows() {
        if self.depth > 5 {
            self.depth = 5
        }
        
        if self.depth < 1 {
            self.depth = 1
        }
        
        if depth == 1 {
            self.topShadowView.shadowOpacity = 0.12
            self.topShadowView.shadowOffset = CGSizeMake(0, 1)
            self.topShadowView.shadowRadius = 1.5
            self.bottomShadowView.shadowOpacity = 0.24
            self.bottomShadowView.shadowOffset = CGSizeMake(0, 1)
            self.bottomShadowView.shadowRadius = 1.0
        }
        
        if depth == 2 {
            self.topShadowView.shadowOpacity = 0.16
            self.topShadowView.shadowOffset = CGSizeMake(0, 3)
            self.topShadowView.shadowRadius = 3.0
            self.bottomShadowView.shadowOpacity = 0.23
            self.bottomShadowView.shadowOffset = CGSizeMake(0, 3)
            self.bottomShadowView.shadowRadius = 3.0
        }
        
        if depth == 3 {
            self.topShadowView.shadowOpacity = 0.19
            self.topShadowView.shadowOffset = CGSizeMake(0, 10)
            self.topShadowView.shadowRadius = 10.0
            self.bottomShadowView.shadowOpacity = 0.23
            self.bottomShadowView.shadowOffset = CGSizeMake(0, 6)
            self.bottomShadowView.shadowRadius = 3.0
        }
        
        if depth == 4 {
            self.topShadowView.shadowOpacity = 0.25
            self.topShadowView.shadowOffset = CGSizeMake(0, 14)
            self.topShadowView.shadowRadius = 14.0
            self.bottomShadowView.shadowOpacity = 0.22
            self.bottomShadowView.shadowOffset = CGSizeMake(0, 10)
            self.bottomShadowView.shadowRadius = 5.0
        }
        
        if depth == 5 {
            self.topShadowView.shadowOpacity = 0.30
            self.topShadowView.shadowOffset = CGSizeMake(0, 19)
            self.topShadowView.shadowRadius = 19.0
            self.bottomShadowView.shadowOpacity = 0.22
            self.bottomShadowView.shadowOffset = CGSizeMake(0, 15)
            self.bottomShadowView.shadowRadius = 6.0
        }
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
