//
//  BaseViewModel.swift
//  DYZB
//
//  Created by 郭明健 on 2018/1/3.
//  Copyright © 2018年 com.joy.www. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel
{
    func loadAnchorData(URLString : String, param : [String : Any]? = nil, finishedCallback : @escaping () -> ())
    {
        MJNetworkTools.requestData(type: .GET, urlString: URLString, parameters: param) { (result) in
            //1.处理数据
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }

            //2.遍历数组中的字典
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }

            //3.完成回调
            finishedCallback()
        }
    }
}
