//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by 郭明健 on 2017/10/27.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit

class RecommendViewModel {
    //MARK:- 懒加载属性
    private lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

//MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData() {
        //1.推荐数据
        
        //2.颜值数据
        
        //3.游戏数据
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1509431328
        MJNetworkTools.requestData(type: .GET,
                                   urlString: "http://capi.douyucdn.cn/api/v1/getHotCate",
                                   parameters: ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()],
                                   headers: nil) {(result) in
                                    //print(result)
                                    //1.将result转成字典类型
                                    guard let resultDict = result as? [String : NSObject] else {return}
                                    
                                    //2.根据data该key，获取数组
                                    guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
                                    
                                    //3.遍历数组，获取字典，并且将字典转成模型对象
                                    for dict in dataArray {
                                        let group = AnchorGroup(dict: dict)
                                        self.anchorGroups.append(group)
                                    }
                                    
                                    for group in self.anchorGroups {
                                        print(group.tag_name)
                                    }
        }
    }
}
