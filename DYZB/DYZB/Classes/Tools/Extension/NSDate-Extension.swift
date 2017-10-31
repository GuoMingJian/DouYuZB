//
//  NSDate-Extension.swift
//  DYZB
//
//  Created by 郭明健 on 2017/10/31.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import Foundation

extension NSDate
{
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
