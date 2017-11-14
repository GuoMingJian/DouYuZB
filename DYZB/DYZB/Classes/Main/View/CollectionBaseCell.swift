//
//  CollectionBaseCell.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/14.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    
    //MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
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
            
            //3.设置封面
            guard let iconUrl = NSURL.init(string: anchor.vertical_src) else {return}
            iconImageView.kf.setImage(with: ImageResource.init(downloadURL: iconUrl as URL))
        }
    }
    
}
