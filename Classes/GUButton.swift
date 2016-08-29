//
//  GUButton.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/29.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class GUButton: UIButton {
    
    @IBInspectable
    var designedFontSize: CGFloat = 0 {
        didSet {
            updateFontSize()
        }
    }
    
    func updateFontSize() {
        self.titleLabel?.font = self.titleLabel?.font.fontWithSize(designedFontSize*proportionForView())
    }
    
}
