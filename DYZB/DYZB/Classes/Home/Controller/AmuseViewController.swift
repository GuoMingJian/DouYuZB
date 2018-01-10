//
//  AmuseViewController.swift
//  DYZB
//
//  Created by 郭明健 on 2017/12/22.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - kItemMargin * 3) / 2
private let kItemNormalH = kItemW * 3 / 4
private let kItemPrettyH = kItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50

private let kHeaderViewID = "kHeaderViewID"
private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"

class AmuseViewController: UIViewController {

    //MARK:- 懒加载属性
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()

    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in

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

    //MARK:- 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        loadData()
    }

}

//MARK:- 设置UI界面
extension AmuseViewController {
    fileprivate func setupUI() {
        view.addSubview(collectionView)
    }
}

//MARK:- 请求数据
extension AmuseViewController {
    fileprivate func loadData() {
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}

//MARK:- 遵守UICollectionView的数据源协议
extension AmuseViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return amuseVM.anchorGroups.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return amuseVM.anchorGroups[section].anchors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.取出模型对象
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        //2.给cell设置数据
        cell.anchor = amuseVM.anchorGroups[indexPath.section].anchors[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView

        //2.给HeaderView设置数据
        headerView.group = amuseVM.anchorGroups[indexPath.section]

        return headerView
    }
}

