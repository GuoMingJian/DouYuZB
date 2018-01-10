//
//  AmuseViewModel.swift
//  DYZB
//
//  Created by 郭明健 on 2018/1/3.
//  Copyright © 2018年 com.joy.www. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
