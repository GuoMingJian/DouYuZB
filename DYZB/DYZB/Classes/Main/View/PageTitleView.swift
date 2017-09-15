//
//  PageTitleView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/15.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    //MARK:- 定义属性
    var titles : [String]
    
    //MARK:- 懒加载属性
    lazy var scrollView : UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        
        return scrollView
        
    }()
    
    //MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        //初始化UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:- 设置UI界面
extension PageTitleView{
    
    func setupUI() {
        //1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加title对应的Label
        setupTitleLabels()
    }
    
    func setupTitleLabels() {
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            
            label.text = title;
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelW : CGFloat = 0
            let labelH : CGFloat = 0
            let labelX : CGFloat = 0
            let labelY : CGFloat = 0
            
        }
    }
}
