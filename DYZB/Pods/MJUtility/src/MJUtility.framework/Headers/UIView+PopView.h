//
//  UIView+PopView.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2015/9/13.
//  Copyright © 2016年 MJ Guo. All rights reserved.
//
//  https://github.com/GuoMingJian
//

//========用法============
/*
 TestView *view = [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:nil options:nil][0];//自定义View
 UIView *popView = [self.view popViewToScreenCenter:view backgroundViewAlpha:0.2 isCanClickBackGroundView:YES];
 //    UIView *popView = [self.view popViewToScreenLeftTop:view backgroundViewAlpha:0 isCanClickBackGroundView:YES leftTopPoint:CGPointMake(100, 100)];
 [self.view addSubview:popView];
 //点击Block
 view.testViewClickBlock = ^(){
 [self.view removePopView:popView];
 };
 */

#import <UIKit/UIKit.h>

@interface UIView (PopView)

/**
 pop一个View居中显示，带背景View。
 */
- (UIView *)popViewToScreenCenter:(UIView *)view
              backgroundViewAlpha:(float)alpha
         isCanClickBackGroundView:(BOOL)isCanClick;

- (UIView *)popViewToScreenLeftTop:(UIView *)view
               backgroundViewAlpha:(float)alpha
          isCanClickBackGroundView:(BOOL)isCanClick
                      leftTopPoint:(CGPoint)point;

- (void)removePopView:(UIView *)view;

@end
