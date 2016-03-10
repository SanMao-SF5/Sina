//
//  PublishViewController.swift
//  Sina
//
//  Created by 沈方武 on 16/3/10.
//  Copyright © 2016年 SanMao. All rights reserved.
//

import UIKit

class PublishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellowColor()
        
        view.addSubview(closeBtn)
        
        
    }

    lazy var closeBtn: UIButton = {
    
        let btn = UIButton()
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.grayColor()
        btn.setTitle("好了", forState: UIControlState.Highlighted)
        
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 30)
        
        btn.addTarget(self, action: "closeBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
        
    }()
    
    func closeBtnClicked(){
    
        dismissViewControllerAnimated(true, completion: nil)
    }

}
