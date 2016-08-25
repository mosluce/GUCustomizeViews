//
//  GUView.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/24.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class GUView: UIView {
    
    static func proportionForView() -> CGFloat {
        let w = UIScreen.mainScreen().bounds.width
        let h = UIScreen.mainScreen().bounds.height
        
        if w > h {
            return w / 1920
        } else {
            return w / 1080
        }
    }
    
}
