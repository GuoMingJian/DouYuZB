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
    lazy var pageTitleView : PageTitleView = {[weak self] in
    
        let titleFrame = CGRect(x: 0, y: kNavigationH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titileView = PageTitleView(frame: titleFrame, titles: titles)
        titileView.delegate = self
        
        return titileView
    }()
    
    lazy var pageContentView : PageContentView = {[weak self] in
        
        //1.确定内容frame
        let contentH = kScreenH - kNavigationH - kTitleViewH - kTabBarH
        let contentFrame = CGRect(x: 0, y: kNavigationH + kTitleViewH, width: kScreenW, height: contentH)
        
        //2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        for _ in 0..<1 {
        
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
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
        
        //不需要调整UIScrollView的内边距
        self.automaticallyAdjustsScrollViewInsets = false
        
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加PageTitleView
        view.addSubview(pageTitleView)
        
        //3.添加contentView
        view.addSubview(pageContentView)
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

//MARK:- 遵守PageTitleViewDelegate
extension HomeViewController : PageTitleViewDelegate
{
    func pageTitleView(pageTitleView: PageTitleView, selectIndex index: Int)
    {
        pageContentView.setCurrentIndex(index: index)
    }
}

//MARK:- 遵守PageContentViewDelegate
extension HomeViewController : PageContentViewDelegate
{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
    {
        //print("progress:\(progress) sourceIndex:\(sourceIndex) targetIndex\(targetIndex)")
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
