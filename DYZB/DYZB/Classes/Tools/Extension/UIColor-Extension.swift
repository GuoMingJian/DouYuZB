//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/18.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

extension UIColor
{
    //MARK:- 构造方法
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat)
    {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    convenience init(hexString:String)
    {
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let length = (cString as NSString).length
        
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7))
        {
            //返回whiteColor
            self.init(red : 0.0, green : 0.0, blue : 0.0, alpha : 1.0)
            return
        }
        if cString.hasPrefix("#")
        {
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符串截取
        var range = NSRange()
        range.location = 0
        
        range.length = 2
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r : UInt32 = 0, g : UInt32 = 0, b : UInt32 = 0
        
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        //根据颜色值创建UIColor
        self.init(red : CGFloat(r) / 255.0,
                  green : CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: 1.0)
    }
    
    //MARK:- 类方法
    //UIColor --> hexString
    public func hexStringFromUIColor() -> String
    {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let hexStr : String = String(format: "%02X%02X%02X",
                        Int(r * 0xff),
                        Int(g * 0xff),
                        Int(b * 0xff))
        return hexStr
    }
}

