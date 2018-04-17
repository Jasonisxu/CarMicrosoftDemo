//
//  ViewController.swift
//  CarDemo
//
//  Created by 刘旭 on 2018/4/13.
//  Copyright © 2018年 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        view.backgroundColor = .red
        
        let btCode = UIButton.init(type: .custom)
        btCode.frame = CGRect(x: 0, y: 0, w: 100, h: 100)
        view.addSubview(btCode)
        
         btCode.startTimer(60, title: "重新获取", mainBGColor: .clear, mainTitleColor: .red, countBGColor: .clear, countTitleColor: .red, handle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

