//
//  MainTabBarController.swift
//  Sina
//
//  Created by 沈方武 on 16/3/10.
//  Copyright © 2016年 SanMao. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加所有的子控制器
        addAllChildVc()
        
        // 设置tabBar的tincolor为橙色
        tabBar.tintColor = UIColor.orangeColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // 获取tabBar按钮的尺寸
        let width = UIScreen.mainScreen().bounds.size.width / CGFloat(childViewControllers.count)
        let height = tabBar.bounds.height
        
        PublishBtn.frame = CGRect(x: width * 2, y: 0, width: width, height: height)
        
        // 将按钮添加到tabBar上
        tabBar.addSubview(PublishBtn)
    }
    
    /**
     添加所有的子控制器
     */
    private func addAllChildVc(){
    
        // 首页
        setAllChildsVcWithNavController(HomeTableController(), norImage: UIImage(named: "tabbar_home")!, selImage: UIImage(named: "tabbar_home_highlighted")!, titleName: "首页")
        
        // 消息
        setAllChildsVcWithNavController(HomeTableController(), norImage: UIImage(named: "tabbar_message_center")!, selImage: UIImage(named: "tabbar_message_center_highlighted")!, titleName: "消息")
        
        // 发布
        setAllChildsVcWithNavController(HomeTableController(), norImage: UIImage(named: "tabbar_compose_icon_add")!, selImage: UIImage(named: "tabbar_compose_icon_add_highlighted")!, titleName: "")
        
        // 发现
        setAllChildsVcWithNavController(HomeTableController(), norImage: UIImage(named: "tabbar_discover")!, selImage: UIImage(named: "tabbar_discover_highlighted")!, titleName: "发现")
        
        // 我
        setAllChildsVcWithNavController(HomeTableController(), norImage: UIImage(named: "tabbar_profile")!, selImage: UIImage(named: "tabbar_profile_highlighted")!, titleName: "我")
        
    }
    
    /**
     把所有的子控制器都包装成导航控制器
     
     - parameter vc:        控制器
     - parameter norImage:  正常图片
     - parameter selImage:  选中图片
     - parameter titleName: 标题
     */
    private func setAllChildsVcWithNavController(vc:(UIViewController), norImage:(UIImage), selImage:(UIImage), titleName:(String)){
    
        // 创建导航控制器
        let navVc = MainNavController()
        // 把所有的控制器都设置为导航控制器的子控制器
        navVc.addChildViewController(vc)
        // 把导航控制器设置为TabBar控制器的根控制器
        addChildViewController(navVc)
        // 设置图片和标题
        vc.tabBarItem.image = norImage
        vc.tabBarItem.selectedImage = selImage
        vc.title = titleName
        
    }
    
    /**
    *  懒加载发布按钮
    */
    lazy var PublishBtn: UIButton = {
    
        // 创建按钮
        let btn = UIButton()
        
        // 设置按钮的背景图片
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        // 设置按钮的图片
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Selected)
        
        // 监听按钮的点击
        btn.addTarget(self, action: "publishBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn.sizeToFit()
        
        return btn
    }()

    // 点击发布按钮执行的方法
    func publishBtnClick(){
    
        // 弹出发布控制器
        presentViewController(PublishViewController(), animated: true, completion: nil)
    }
 
}
