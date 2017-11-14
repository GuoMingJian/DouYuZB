//
//  PageTitleView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/15.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class
{
    func pageTitleView(pageTitleView : PageTitleView, selectIndex index : Int)
}

let kScrollLineH : CGFloat = 2
let kNomalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {
    
    //MARK:- 定义属性
    var currentIndex : Int = 0
    var titles : [String]
    weak var delegate : PageTitleViewDelegate?
    
    //MARK:- 懒加载属性
    lazy var scrollView : UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        
        return scrollView
        
    }()
    
    lazy var scrollLine : UIView = {
    
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    }()
    
    lazy var titleLabels : [UILabel] = [UILabel]()//记录label
    
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
        
        //3.设置底线和滑动的线
        setupBottomLineAndScrollLine()
    }
    
    func setupTitleLabels() {
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            
            //1.创建label
            let label = UILabel()
            
            //2.设置label属性
            label.text = title;
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNomalColor.0, g: kNomalColor.1, b: kNomalColor.2)
            label.textAlignment = .center
            
            //3.设置label的Frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            //5.给label添加点击手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer()
            tapGes.addTarget(self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    func setupBottomLineAndScrollLine(){
        
        //底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //滑动的线
        scrollView.addSubview(scrollLine)
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        currentIndex = firstLabel.tag
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

//MARK:- 监听label的点击
extension PageTitleView
{
    @objc func titleLabelClick(tapGes : UITapGestureRecognizer)
    {
        //0.当前Label
        guard let currentLabel = tapGes.view as? UILabel else {return}
        
        //1.当重复点击相同Title，直接返回
        if currentLabel.tag == currentIndex { return }
        
        //2.之前Label
        let beforeLabel = titleLabels[currentIndex]
        
        //3.更新点击后titleLabel的颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        beforeLabel.textColor = UIColor(r: kNomalColor.0, g: kNomalColor.1, b: kNomalColor.2)
        
        //4.保存点击Label下标
        currentIndex = currentLabel.tag
        
        //5.状态条移动动画
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15, animations: {
            self.scrollLine.frame.origin.x = scrollLineX
        })
        
        //6.通知代理
        delegate?.pageTitleView(pageTitleView: self, selectIndex: currentIndex)
    }
}

//MARK:- 对外暴露的方法
extension PageTitleView
{
    func setTitleWithProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int)
    {
        //1.去除sourceLabel / targetLabel
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        //2.处理滑块的逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        //3.颜色渐变
        //3.1取出变化范围
        let colorDelta = (kSelectColor.0 - kNomalColor.0, kSelectColor.1 - kNomalColor.1, kSelectColor.2 - kNomalColor.2)
        //3.2变化sourceLabel
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        //3.3变化targetLabel
        targetLabel.textColor = UIColor(r: kNomalColor.0 + colorDelta.0 * progress, g: kNomalColor.1 + colorDelta.1 * progress, b: kNomalColor.2 + colorDelta.2 * progress)
        
        //4.记录最新的index
        currentIndex = targetIndex
    }
}
