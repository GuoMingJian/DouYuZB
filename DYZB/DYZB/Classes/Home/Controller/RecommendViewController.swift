//
//  RecommendViewController.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/25.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - kItemMargin * 3) / 2
private let kItemNormalH = kItemW * 3 / 4
private let kItemPrettyH = kItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50
private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90.0

private let kHeaderViewID = "kHeaderViewID"
private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"

class RecommendViewController: UIViewController {
    
    //MARK:- 懒加载属性
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    private lazy var collectionView : UICollectionView = {[unowned self] in
        
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemNormalH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        //2.创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]//随着父控件缩小而缩小
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        
        //3.注册cell
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        return collectionView
        }()
    
    private lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        
        return cycleView
    }()
    
    private lazy var gameView : RecommendGameView = {
       
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        
        return gameView
        
    }()
    
    //MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI界面
        setupUI()
        
        //请求数据
        loadData()
    }
    
}

//MARK:- 设置UI界面内容
extension RecommendViewController
{
    private func setupUI()
    {
        //1.添加collectionView
        view.addSubview(collectionView)
        
        //2.将cycleView添加到collectionView
        collectionView.addSubview(cycleView)
        
        //3.将gameView添加到collectionView
        collectionView.addSubview(gameView)
        
        //4.设置collectionView内边距
        collectionView.contentInset = UIEdgeInsets(top: (kCycleViewH + kGameViewH), left: 0, bottom: 0, right: 0)
    }
}

//MARK:- 请求数据
extension RecommendViewController {
    private func loadData() {
        
        //请求推荐数据
        recommendVM.requestData {
            
            //1.展示推荐数据
            self.collectionView.reloadData()
            
            //2.将数据传递给GameView
            self.gameView.groups = self.recommendVM.anchorGroups
        }
        
        //请求无限轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

//MARK:- 遵守UICollectionView的数据源协议
extension RecommendViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let group = recommendVM.anchorGroups[section]
        return group.anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.取出模型对象
        let group = recommendVM.anchorGroups[indexPath.section]
        let anchor = group.anchors[indexPath.item]
        
        //2.定义cell
        let cell : CollectionBaseCell!
        
        //3.取出cell
        if indexPath.section == 1
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
        }
        else
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        }
        
        //4.将模型赋值cell
        cell.anchor = anchor;
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //1.取出section的HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        //2.取出模型
        headerView.group = recommendVM.anchorGroups[indexPath.section]
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kItemPrettyH)
        }
        
        return CGSize(width: kItemW, height: kItemNormalH)
    }
}
