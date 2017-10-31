//
//  MJCollectionViewFlowLayout.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2016/3/7.
//  Copyright © 2016年 MJ Guo. All rights reserved.
//
//  https://github.com/GuoMingJian
//

//========用法============
/*
 1.#import "MJCollectionViewFlowLayout.h"
 2.实现协议 <MJCollectionViewDelegateFlowLayout>
 3.创建使用
 MJCollectionViewFlowLayout *layout = [[MJCollectionViewFlowLayout alloc] init];
 layout.minimumInteritemSpacing = 0.0f;  //水平间距
 layout.minimumLineSpacing = 0.0f;       //垂直间距
 layout.delegate = self;
 self.myCollectionView.collectionViewLayout = layout;
 */

#import <UIKit/UIKit.h>

@protocol  MJCollectionViewDelegateFlowLayout<UICollectionViewDelegateFlowLayout>

@end

@interface MJCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic,weak) id<MJCollectionViewDelegateFlowLayout> delegate;

@end
