//
//  AnchorGroup.swift
//  DYZB
//
//  Created by 郭明健 on 2017/10/31.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject
{
    //该组中对应的房间信息
    var room_list : [AnchorModel]?
    
    //组显示的标题
    var tag_name : String = ""
    
    //组显示的图标
    var icon_name : String = "home_header_normal"
    
    init(dict : [String : NSObject]) {
        super.init()

        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}