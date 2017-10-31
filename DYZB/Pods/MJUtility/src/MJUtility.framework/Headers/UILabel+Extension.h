//
//  UILabel+Extension.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2017/3/14.
//  Copyright © 2017年 郭明健. All rights reserved.
//
//  https://github.com/GuoMingJian
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

@property (nonatomic) NSString *verticalText;

@end

/*
 
 NSString *string = @"床前明月光，疑是地上霜。";
 UILabel *label = [[UILabel alloc] initWithFrame:(CGRectMake(100, 100, 0, 0))];
 label.textColor = [UIColor redColor];
 label.verticalText = string;
 [label sizeToFit];
 [self.view addSubview:label];
 
 */
