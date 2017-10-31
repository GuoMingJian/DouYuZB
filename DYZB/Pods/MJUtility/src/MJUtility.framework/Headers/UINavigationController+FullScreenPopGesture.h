//
//  UINavigationController+FullScreenPopGesture.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2016/7/11.
//  Copyright © 2016年 MJ Guo. All rights reserved.
//
//  https://github.com/GuoMingJian
//

#import <UIKit/UIKit.h>

@interface UINavigationController (FullScreenPopGesture)

/**
 设置全屏pop手势
 
 @param enable YES : 全屏pop手势生效，NO : 不生效
 */
- (void)setFullScreenPopGesture:(BOOL)enable;

@end
