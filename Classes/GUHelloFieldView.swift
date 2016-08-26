//
//  GUHelloFieldView.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/26.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

@IBDesignable
public class GUHelloFieldView: GUTextFieldView {
    
    public func viewForLeftView() -> UIView {
        let view = UIView()
        
        view.backgroundColor = UIColor.redColor()
        
        return view
    }
    
    public func rectForLeftView(bounds: CGRect) -> CGRect {
        return CGRectMake(0, 0, bounds.height, bounds.height)
    }
    
}
