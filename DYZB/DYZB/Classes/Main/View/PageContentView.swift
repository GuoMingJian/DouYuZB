//
//  PageContentView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/18.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

protocol PageContentViewDelegate : class
{
    func pageContentView(contentView : PageContentView, progress : CGFloat, sourceIndex : Int, targetIndex : Int)
}

let ContentID = "ContentID"

class PageContentView: UIView {
    
    //MARK:- 自定义属性
    var childVcs : [UIViewController]
    weak var parentViewController : UIViewController?
    var isForbidScrollDelegate : Bool = false //禁止
    private var startOffsetX : CGFloat = 0
    weak var delegate : PageContentViewDelegate?
    
    //MARK:- 懒加载属性
    lazy var collectionView : UICollectionView = {[weak self] in
    
        //1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //2.创建UIColletionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentID)
        
        return collectionView
    }()
    
    //MARK:- 自定义构造函数
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController?) {
        
        //保存属性
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        //设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- 设置UI界面
extension PageContentView
{
    func setupUI()
    {
        //1.将所有的子控制器添加父控制器中
        for childVc in childVcs
        {
            parentViewController?.addChildViewController(childVc)
        }
        
        //2.添加UICollectionView,用于在cell中存放控制器的View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//MARK:- 遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //1.创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentID, for: indexPath)
        
        //2.移除子内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        //3.给cell设置内容
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

//MARK:- 遵守UICollectionViewDelegate
extension PageContentView : UICollectionViewDelegate
{
    //开始拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        isForbidScrollDelegate = false
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        //0.判断是否是点击事件
        if isForbidScrollDelegate
        {
            return
        }
        //1.定义获取的数据
        var progress : CGFloat = 0
        var sourceIndex : Int = 0
        var targetIndex : Int = 0
        
        //2.判断是左滑还是右滑
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        if currentOffsetX > startOffsetX
        {//左滑
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            sourceIndex = Int(currentOffsetX / scrollViewW)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count
            {
                targetIndex = childVcs.count - 1
            }
            //完全划过去
            if currentOffsetX - startOffsetX == scrollViewW
            {
                progress = 1
                targetIndex = sourceIndex
            }
        }
        else
        {//右滑
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            targetIndex = Int(currentOffsetX / scrollViewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count
            {
                sourceIndex = childVcs.count - 1
            }
        }
        //3.传递给titleView
        delegate?.pageContentView(contentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

//MARK:- 对外暴露的方法
extension PageContentView
{
    func setCurrentIndex(index : Int)
    {
        // 1.记录需要禁止执行的代理方法
        isForbidScrollDelegate = true
        
        let offsetX = CGFloat(index) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x : offsetX, y : 0), animated: false)
    }
}
