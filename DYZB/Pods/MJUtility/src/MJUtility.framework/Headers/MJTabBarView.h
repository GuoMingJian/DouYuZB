//
//  MJTabBarView.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2016/1/15.
//  Copyright © 2016年 MJ Guo. All rights reserved.
//
//  https://github.com/GuoMingJian
//

//========用法============
/*
 //1.#import "MJTabBarView.h"
 //2.创建TabBarViewController 并继承MJTabBarViewDelegate协议
 //3.设置TabBarViewController 的viewControllers
 //4.使用MJTabBarView
 MJTabBarView *_tabBar = [[MJTabBarView alloc] initWithFrame:self.tabBar.bounds];
 _tabBar.delegate = self;
 CGSize iconSize = CGSizeMake(23, 23);
 NSArray *normalArray = @[[UIImage imageNamed:@"A.png"],
 [UIImage imageNamed:@"B.png"],
 [UIImage imageNamed:@"C.png"],
 [UIImage imageNamed:@"D.png"]];
 NSArray *selectArray = @[[UIImage imageNamed:@"A_a.png"],
 [UIImage imageNamed:@"B_b.png"],
 [UIImage imageNamed:@"C_c.png"],
 [UIImage imageNamed:@"D_d.png"]];
 [_tabBar setMJTabBarNormalIcons:normalArray selectedIcons:selectArray iconSize:iconSize];
 [_tabBar setMJTabBarBGColor:[UIColor whiteColor] normalItemBGImage:nil selectedItemBGImage:nil];
 NSArray *titleArray = @[@"主菜单", @"消息", @"发现", @"我的资料"];
 [_tabBar setMJTabBarTexts:titleArray normalTextColor:[UIColor blackColor] selectedTextColor:[UIColor greenColor]];
 [_tabBar showMJTabBarInTabBarController:self];
 //5.实现MJTabBarViewDelegate协议 的方法。
 //- (void)tabBar:(MJTabBarView *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to
 //{
 //    self.selectedIndex = to;
 //}
 */
//=======================

#import <UIKit/UIKit.h>

@class MJTabBarView;
@protocol MJTabBarViewDelegate<NSObject>

/**
 *  工具栏按钮被选中, 记录从哪里跳转到哪里. (方便做相应动画特效)
 *
 *  @param tabBar 自定义TabBar
 *  @param from   当前页面index
 *  @param to     将要跳转页面index
 */
@required
- (void)tabBar:(MJTabBarView *)tabBar
  selectedFrom:(NSInteger)from
            to:(NSInteger)to;

@end

@interface MJTabBarView : UIImageView

@property (nonatomic , weak) id<MJTabBarViewDelegate> delegate;

/**
 小圆点默认背景颜色[默认红色]
 */
@property (strong, nonatomic) UIColor *defaultSamllRedViewBGColor;

/**
 icon 文本字体大小[8-15]
 */
@property (assign, nonatomic) CGFloat defaultTextFontSize;

#pragma mark - public

/**
 *  根据TabBarController获取MJTabBar,前提是将MJTabBar添加到了TabBarController
 *
 *  @param tabBarVC TabBarController
 *
 *  @return MJTabBar
 */
+ (MJTabBarView *)getMJTabBar:(UITabBarController *)tabBarVC;

#pragma mark - private

/**
 显示MJTabBar
 */
- (void)showMJTabBar;

/**
 隐藏MJTabBar
 */
- (void)hiddenMJTabBar;

/**
 设置MJTabBar背景色，按钮默认状态及选中状态背景色
 
 @param color MJTabBar背景色背景色
 @param normalItemBGImage 按钮默认状态背景色
 @param selectedItemBGImage 按钮选中状态背景色
 */
- (void)setMJTabBarBGColor:(UIColor *)color
         normalItemBGImage:(UIImage *)normalItemBGImage
       selectedItemBGImage:(UIImage *)selectedItemBGImage;

/**
 设置MJTabBar Icon图标 [默认状态及选中状态Icon]
 
 @param normalIcons 默认状态icon数组
 @param selectedIcons 选中状态icon数组
 @param iconSize icon尺寸
 */
- (void)setMJTabBarNormalIcons:(NSArray *)normalIcons
                 selectedIcons:(NSArray *)selectedIcons
                      iconSize:(CGSize)iconSize;

/**
 设置MJTabBar 文本，及默认状态及选中状态 的文本颜色
 
 @param textArray 文本数组
 @param normalTextColor 默认状态文本颜色
 @param selectedTextColor 选中状态文本颜色
 */
- (void)setMJTabBarTexts:(NSArray *)textArray
         normalTextColor:(UIColor *)normalTextColor
       selectedTextColor:(UIColor *)selectedTextColor;

/**
 将MJTabBar 显示在UITabBarController上
 
 @param tabBarVC UITabBarController
 */
- (void)showMJTabBarInTabBarController:(UITabBarController *)tabBarVC;

/**
 根据index 触发点击icon效果[最左边iconIndex为0，往右index依次+1]
 
 @param iconIndex iconIndex
 */
- (void)clickMJTabBarButtonByIndex:(NSInteger)iconIndex;

/**
 根据index 显示对应的未读信息数量
 
 @param iconIndex iconIndex
 @param unReadcount 未读信息数量
 */
- (void)showMJTaBarUnReadMessage:(NSInteger)iconIndex
                    messageCount:(NSInteger)unReadcount;

/**
 根据index 隐藏未读信息数量
 
 @param iconIndex iconIndex
 */
- (void)hiddenMJTaBarUnReadMessage:(NSInteger)iconIndex;

/**
 根据index 显示对应的小红点
 
 @param iconIndex iconIndex
 */
- (void)showMJTabBarSamllRedView:(NSInteger)iconIndex;

/**
 根据index 隐藏小红点
 
 @param iconIndex iconIndex
 */
- (void)hiddenMJTabBarSamllRedView:(NSInteger)iconIndex;

/**
 获取未读信息，if (isSmallRedData == NO)，获取未读信息数量；
 YES 获取小圆点，0隐藏
 */
- (NSString *)getUnReadMsgByIndex:(NSInteger)index
                   isSmallRedData:(BOOL)isSmallRedData;

@end
