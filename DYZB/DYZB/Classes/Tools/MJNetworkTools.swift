//
//  MJNetworkTools.swift
//  DYZB
//
//  Created by 郭明健 on 2017/9/16.
//  Copyright © 2017年 com.joy.www. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class MJNetworkTools {
    
    class func requestData(type : MethodType,
                           urlString : String,
                           parameters : [String : Any]? = nil,
                           headers : [String : String]? = nil,
                           finishedCallback : @escaping (_ result : AnyObject) -> ()) {
        
        // 1.获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post

        // 2.发送网络请求
        Alamofire.request(urlString,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result as AnyObject)
        }
    }
 
}
