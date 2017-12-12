//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/17.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    //MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- 定义模型属性
    var baseGameModel : BaseGameModel? {
        didSet {
            titleLabel.text = baseGameModel?.tag_name
            
            let iconUrl = NSURL.init(string: baseGameModel?.icon_url ?? "")!
            iconImageView.kf.setImage(with: ImageResource.init(downloadURL: iconUrl as URL), placeholder : UIImage(named: "home_more_btn"))
        }
    }
    
    //MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
