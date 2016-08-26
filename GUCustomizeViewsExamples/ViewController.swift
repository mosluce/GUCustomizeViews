//
//  ViewController.swift
//  GUCustomizeViewsExamples
//
//  Created by 默司 on 2016/8/26.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import GUCustomizeViews

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: GUTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show(sender: AnyObject) {
        textField.setError("This is error")
    }
    
    @IBAction func hide(sender: AnyObject) {
        textField.setError(nil)
    }
}

