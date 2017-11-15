//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by 郭明健 on 2017/11/15.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class RecommendCycleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
    }
}

//MARK:- 快速创建View的类方法
extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}
