//
//  AnchorModel.swift
//  DYZB
//
//  Created by 郭明健 on 2017/10/31.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    
    //房间号
    var room_id : Int = 0
    
    //房间图片对应的URLString
    var vertical_src : String = ""
    
    //0电脑直播，1手机直播
    var isVertical : Int = 0
    
    //房间名称
    var room_name : String = ""
    
    //主播昵称
    var nickname : String = ""
    
    //观看人数
    var online : Int = 0
    
    //所在城市
    var anchor_city : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
