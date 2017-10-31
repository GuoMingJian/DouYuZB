//
//  UIView+Extension.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2016/1/2.
//  Copyright © 2017年 郭明健. All rights reserved.
//
//  https://github.com/GuoMingJian
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topLeft;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

@end
