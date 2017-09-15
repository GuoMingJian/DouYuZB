//
//  HomeViewController.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/13.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

private var kTitleViewH : CGFloat = 45

class HomeViewController: UIViewController {
    
    //MARK:- 懒加载属性
    lazy var pageTitleView : PageTitleView = {
    
        let titleFrame = CGRect(x: 0, y: kNavigationH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titileView = PageTitleView(frame: titleFrame, titles: titles)
        titileView.backgroundColor = UIColor.cyan
        return titileView
    }()
    
    //MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI界面
        setupUI()
    }

}

//MARK: 设置UI界面
extension HomeViewController {

    func setupUI() {
        
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加PageTitleView
        view.addSubview(pageTitleView)
    }
    
    func setupNavigationBar() {
        
        //logo
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        
        //历史记录
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        //搜索
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        //二维码
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        self.navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
    }
    
}
