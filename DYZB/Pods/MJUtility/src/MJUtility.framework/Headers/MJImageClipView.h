//
//  MJImageClipView.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2015/11/2.
//  Copyright © 2016年 MJ Guo. All rights reserved.
//
//  https://github.com/GuoMingJian
//

/*
 注意:iOS 10 增加了新的安全设定，需要在plist文件添加相应的字段：
 1.Privacy - Photo Library Usage Description 我们需要使用您的相册
 2.Privacy - Camera Usage Description 我们需要使用您的相机
 */

//========用法============
/*
 1.#import "MJImageClipView.h"
 2.创建并使用
 MJImageClipView *mjClipView = [[MJImageClipView alloc] initWithFrame:self.view.bounds];
 [self.view addSubview:mjClipView];
 [mjClipView clipImage:image callBack:^(UIImage *image)
 {
 if (image)//当image为nil时，是点击了取消按钮。
 {
 //self.headImageView.image = image;
 }
 }];
 */

//====常搭配的用法如下==== 实现<UIImagePickerControllerDelegate , UINavigationControllerDelegate>
/*
 - (void)chooseGetImageType
 {
 UIAlertAction *photoLibrary = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
 UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
 [pickerVC setAllowsEditing:NO];
 [pickerVC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
 [pickerVC setDelegate:self];
 [self presentViewController:pickerVC animated:YES completion:nil];
 [[MJTabBarView getMJTabBar:self.tabBarController] hiddenMJTabBar];
 }];
 UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
 if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
 {
 UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
 [pickerVC setAllowsEditing:NO];
 [pickerVC setSourceType:UIImagePickerControllerSourceTypeCamera];
 [pickerVC setDelegate:self];
 [self presentViewController:pickerVC animated:YES completion:nil];
 [[MJTabBarView getMJTabBar:self.tabBarController] hiddenMJTabBar];
 }
 else
 {
 //NSLog(@"该设备无摄像头");
 [MJUtilities showMJTipView:@"该设备无摄像头"];
 }
 }];
 UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
 //
 UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
 [alertC addAction:photoLibrary];
 [alertC addAction:camera];
 [alertC addAction:cancel];
 [self presentViewController:alertC animated:YES completion:nil];
 }
 
 //UIImagePickerControllerDelegate
 - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
 {
 UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
 [self dismissViewControllerAnimated:YES completion:nil];
 //处理图片剪切
 [mjClipView clipImage:image callBack:^(UIImage *image)
 {
 if (image)
 {
 //self.headImageView.image = image;
 }
 [[MJTabBarView getMJTabBar:self.tabBarController] showMJTabBar];
 }];
 }
 */
//=======================

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImageClipType)
{
    ImageClipCircle = 0,    //切圆形，一般用户处理头像
    ImageClipHerizonRect,
    ImageClipVerticalRect
};

@interface MJImageClipView : UIView

/**
 圆形镂空的宽度
 */
@property(nonatomic, assign)CGFloat circleWidth;

/**
 需要剪切的图片
 */
@property(nonatomic, strong)UIImage *needClipImage;

/**
 剪切图片的样式
 */
@property(nonatomic, assign)ImageClipType clipType;

#pragma mark - private

/**
 图片剪切 [默认头像剪切]
 */
- (void)clipImage:(UIImage *)needClipImage
         callBack:(void(^)(UIImage *image))callBack;

/**
 图片剪切
 
 @param needClipImage 需要剪切的图片对象
 @param clipType 剪切类型
 @param callBack 图片处理后的回调，点击取消时，回调的image对象为nil
 */
- (void)clipImage:(UIImage *)needClipImage
         clipType:(ImageClipType)clipType
         callBack:(void(^)(UIImage *image))callBack;

@end

