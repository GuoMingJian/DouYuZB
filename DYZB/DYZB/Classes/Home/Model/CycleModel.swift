//
//  CycleModel.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/16.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class CycleModel: NSObject {

    //标题
    var title : String = ""
    
    //展示的图片地址
    var pic_url : String = ""
    
    //主播信息对应的字典
    var room : [String : NSObject]? {
        didSet {
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    
    //主播信息对应的模型
    var anchor : AnchorModel?
    
    //MARK:- 自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()

        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
