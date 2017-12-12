//
//  RecommendGameView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/16.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMarg : CGFloat = 10

class RecommendGameView: UIView {
    
    //MARK:- 定义数据属性
    var groups : [AnchorGroup]? {
        didSet {
            //1.移除前两组数据
            groups?.removeFirst()
            groups?.removeFirst()
            
            //2.添加"更多组"
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            //3.刷新表格
            collectionView.reloadData()
        }
    }
    
    //MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        
        //注册Cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        //给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMarg, bottom: 0, right: kEdgeInsetMarg)
        
    }
}

//MARK:- 快速创建View的类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

//MARK:- 遵守UICollectionView数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        let group = groups![indexPath.item]
        cell.baseGameModel = group
        
        return cell
    }
    
}
