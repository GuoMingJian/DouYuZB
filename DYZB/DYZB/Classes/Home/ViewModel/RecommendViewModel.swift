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
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    private lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    private lazy var prettyGroup : AnchorGroup = AnchorGroup()
}

//MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData(finishCallback : @escaping () -> ()) {
        
        //1.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]
        
        //2.创建dispatchGroup
        let dGroup = DispatchGroup()
        
        //3.推荐数据
        dGroup.enter()
        MJNetworkTools.requestData(type: .GET,
                                   urlString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom",
                                   parameters: ["time" : NSDate.getCurrentTime()],
                                   headers: nil) {(result) in
                                    //1.将result转成字典模型
                                    guard let resultDict = result as? [String : NSObject] else {return}
                                    
                                    //2.根据data该key，获取数据
                                    guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
                                    
                                    //3.遍历字典，并且转成模型对象
                                    
                                    //3.1 设置组的属性
                                    self.bigDataGroup.tag_name = "热门"
                                    self.bigDataGroup.icon_name = "home_header_hot"
                                    
                                    //3.2 获取主播数据
                                    for dict in dataArray {
                                        let anchor = AnchorModel(dict: dict)
                                        self.bigDataGroup.anchors.append(anchor)
                                    }
                                    
                                    //3.3 离开组
                                    dGroup.leave()
        }
        
        //4.颜值数据
        dGroup.enter()
        MJNetworkTools.requestData(type: .GET,
                                   urlString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom",
                                   parameters: parameters,
                                   headers: nil) {(result) in
                                    //1.将result转成字典模型
                                    guard let resultDict = result as? [String : NSObject] else {return}
                                    
                                    //2.根据data该key，获取数据
                                    guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
                                    
                                    //3.遍历字典，并且转成模型对象
                                    
                                    //3.1 设置组的属性
                                    self.prettyGroup.tag_name = "颜值"
                                    self.prettyGroup.icon_name = "home_header_phone"
                                    
                                    //3.2 获取主播数据
                                    for dict in dataArray {
                                        let anchor = AnchorModel(dict: dict)
                                        self.prettyGroup.anchors.append(anchor)
                                    }
                                    
                                    //3.3 离开组
                                    dGroup.leave()
        }
        
        //5.游戏数据
        dGroup.enter()
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1509431328
        MJNetworkTools.requestData(type: .GET,
                                   urlString: "http://capi.douyucdn.cn/api/v1/getHotCate",
                                   parameters: parameters,
                                   headers: nil) {(result) in
                                    //1.将result转成字典类型
                                    guard let resultDict = result as? [String : NSObject] else {return}
                                    
                                    //2.根据data该key，获取数组
                                    guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
                                    
                                    //3.遍历数组，获取字典，并且将字典转成模型对象
                                    for dict in dataArray {
                                        let group = AnchorGroup(dict: dict)
                                        self.anchorGroups.append(group)
                                    }
                                    
                                    //4 离开组
                                    dGroup.leave()
        }
        
        //6.所有数据都请求到，之后进行排序
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }
        
    }
}
