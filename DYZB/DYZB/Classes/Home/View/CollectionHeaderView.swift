//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/25.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    //MARK:- 控件属性
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!
    
    //MARK:- 定义模型属性
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
    @IBAction func moreBtnAction(_ sender: Any) {
        print("颜值-更多")
    }
}

//MARK:- 从xib中快速创建的类方法
extension CollectionHeaderView
{
    class func collectionHeaderView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
