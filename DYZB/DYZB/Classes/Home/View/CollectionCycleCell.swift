//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/16.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {

    //MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconUrl = NSURL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: ImageResource.init(downloadURL: iconUrl as URL), placeholder : UIImage(named: "Img_default"))
        }
    }

}
