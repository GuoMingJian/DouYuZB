//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/15.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    /* 类方法
    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        let barButtonItem = UIBarButtonItem(customView: btn)
        
        return barButtonItem
    }
     */
    
    //便利构造函数: 1.convenience开头  2.在构造函数中必须明确调用一个构造函数(self)
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }
        else{
            btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        }
        
        self.init(customView: btn)
    }
}
