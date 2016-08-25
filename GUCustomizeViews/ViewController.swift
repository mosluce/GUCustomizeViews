//
//  ViewController.swift
//  GUCustomizeViews
//
//  Created by 默司 on 2016/8/25.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldView: GUTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hide(sender: AnyObject) {
        textFieldView.setErrorMessage(nil)
    }
    
    @IBAction func show(sender: AnyObject) {
        textFieldView.setErrorMessage("世界是錯誤的！")
    }
}

