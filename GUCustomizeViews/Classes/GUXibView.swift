//
//  GUXibView.swift
//  GotyouApp
//
//  Created by 默司 on 2016/8/23.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

public class GUXibView: UIView {
    
    @IBOutlet var contentView:UIView?
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        NSBundle(forClass: self.classForCoder).loadNibNamed(nibName(), owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        self.insertSubview(content, atIndex: 0)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    func nibName() -> String? {
        return nil
    }
    
}
