//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/26.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class CollectionPrettyCell: UICollectionViewCell {

    //MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    
    //MARK:- 定义模型属性
    var anchor : AnchorModel? {
        didSet {
            //0.校验模型是否有值
            guard let anchor = anchor else {return}
            //1.取出在线人数
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            }
            else
            {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            //2.昵称
            nickNameLabel.text = anchor.nickname
            
            //3.所在城市
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            
            //4.封面图片
        }
    }
}
