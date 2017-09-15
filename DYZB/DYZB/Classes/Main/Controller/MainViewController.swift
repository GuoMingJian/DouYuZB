//
//  MainViewController.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/13.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc(vcName: "Home")
        addChildVc(vcName: "Live")
        addChildVc(vcName: "Follow")
        addChildVc(vcName: "Profile")
    }
    
    //MARK:- 私有方法
    /// 初始化子控制器
    ///
    /// - Parameter vcName: storyboard名称
    private func addChildVc(vcName : String)
    {
        //1.通过storyboard获取控制器
        let vc = UIStoryboard.init(name: vcName, bundle: nil).instantiateInitialViewController()!
        
        //2.将childVc作为子控制器
        addChildViewController(vc)
    }

    //MARK:
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
