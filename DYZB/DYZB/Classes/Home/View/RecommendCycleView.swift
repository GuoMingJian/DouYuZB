//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/15.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"
private let kCycleTimeInterval = 3.0
private let kMaxArrCount : Int = 10000

class RecommendCycleView: UIView {

    //MARK:- 定义属性
    var cycleTimer : Timer?
    var cycleModels : [CycleModel]? {
        didSet {
            
            //1.刷新collectionView
            collectionView.reloadData()
            
            //2.设置pageControl个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            //3.默认滚动到中间某一个位置
            let indexPath = NSIndexPath.init(item: (cycleModels?.count ?? 0) * Int(kMaxArrCount / 2), section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
            
            //4.添加轮播定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    //MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        
        //注册cell
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //设置collectionView layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

//MARK:- 快速创建View的类方法
extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

//MARK:- 遵守UICollectionView的数据源协议
extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * kMaxArrCount //collectionView cell自身会循环利用
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        
        let cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        cell.cycleModel = cycleModel
        
        return cell
    }
}

//MARK:- 遵守UICollectionView的代理协议
extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //1.获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        //2.计算pageControl的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

//MARK:- 对定时器的操作方法
extension RecommendCycleView {
    private func addCycleTimer() {
        cycleTimer = Timer.init(timeInterval: kCycleTimeInterval, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .commonModes)
    }
    
    private func removeCycleTimer() {
        cycleTimer?.invalidate() //从运行循环中移除
        cycleTimer = nil
    }
    
    @objc private func scrollToNext() {
        
        //1.获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        //2.滚动到该位置
        collectionView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
    }
}
