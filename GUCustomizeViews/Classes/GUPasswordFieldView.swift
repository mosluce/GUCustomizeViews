//
//  GUPasswordFieldView.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/25.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class GUPasswordFieldView: GUTextFieldView {
    
    override func commonInit() {
        super.commonInit()
        
        field.secureTextEntry = true
    }
    
    override func viewForLeftView() -> UIView? {
        let view = UIView()
        let image = UIImage(named: "icon_psw_01@1x", inBundle: NSBundle(forClass: self.classForCoder), compatibleWithTraitCollection: nil)
        let imageView = UIImageView(image: image)
        
        view.addSubview(imageView)
        
        imageView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(view.snp_height).multipliedBy(0.714)
        }
        
        return view
    }
    
    override func frameForLeftView(bounds: CGRect) -> CGRect {
        return CGRectMake(0, 0, bounds.height, bounds.height)
    }
    
}
