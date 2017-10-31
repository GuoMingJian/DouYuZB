//
//  MJTools.h
//  QQ群:286380794
//
//  Created by 郭明健 on 2016/9/8.
//  Copyright © 2016年 郭明健. All rights reserved.
//
//  https://github.com/GuoMingJian
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*
 提示框显示的位置，默认居中
 */
typedef NS_ENUM(NSInteger, MJ_Alignment)
{
    MJ_Center = 0,
    MJ_Top = 1,
    MJ_Bottom = 2,
};

/**
 排序类型
 */
typedef NS_ENUM(NSInteger, SortType)
{
    MaxToMin = 0,
    MinToMax = 1,
};

@interface MJTools : NSObject

/**
 是否打开日志输出[默认NO]
 */
+ (void)setLogEnabled:(BOOL)enable;

/**
 是否打开日志输出[默认NO]
 */
+ (BOOL)isCanLog;

#pragma mark - iPhone Informations

/**
 当前APP名称
 */
+ (NSString *)appName;

/**
 获取APP 版本
 */
+ (NSString *)appVersion;

/**
 获取APP Build
 */
+ (NSString *)appBuild;

/**
 获取APP Bundle Identifier
 */
+ (NSString *)appBundleIdentifier;

/**
 手机名称
 */
+ (NSString *)iPhoneName;

/**
 手机型号
 */
+ (NSString *)iPhoneModel;

/**
 手机系统版本
 */
+ (NSString *)iPhoneSystemVersion;

/**
 手机电量
 */
+ (int)iPhoneBatteryLevel;

/**
 手机状态栏网络[注意：网络切换时，手机状态栏改变较慢(非实时)]
 [@"无网络",@"2G",@"3G",@"4G",@"WiFi"]
 */
+ (NSString *)iPhoneNetworkState;

/**
 当前手机连接网络的ip地址
 */
+ (NSString *)iPhoneIpAddresses;

/**
 手机UUID(Universally Unique Identifier) 通用唯一识别码
 */
+ (NSString *)iPhoneUUID;

/**
 是否越狱
 */
+ (BOOL)isJailBreak;

/**
 是否禁止锁屏
 */
+ (void)setLockScreen:(BOOL)isLock;

/**
 更改iOS状态栏的颜色
 */
+ (void)setStatusBarBackgroundColor:(UIColor *)color;

#pragma mark - Get Text Width And Height

/**
 文本显示Size
 */
+ (CGSize)textSize:(NSString *)text
              font:(UIFont *)font;

/**
 文本显示Rect
 */
+ (CGRect)textRect:(NSString *)str
              font:(UIFont *)font
       displaySize:(CGSize)size;

/**
 文本宽度[文字,字体大小]
 */
+ (CGFloat)textWidth:(NSString *)text
            fontSize:(CGFloat)size;

/**
 文本宽度[文字,字体]
 */
+ (CGFloat)textWidth:(NSString *)text
                font:(UIFont *)font;

/**
 单行文本高度[文字,字体大小]
 */
+ (CGFloat)textHeight:(NSString *)text
             fontSize:(CGFloat)size;

/**
 多行文本高度[文字,字体大小,文字最大显示宽度]
 */
+ (CGFloat)multableTextHeight:(NSString *)text
                     fontSize:(CGFloat)size
                 displayWidth:(CGFloat)displayWidth;

#pragma mark - UIKit Operation Funtions

/**
 清空子控件
 */
+ (void)clearAllSubview:(UIView *)view;

/**
 设置圆角
 */
+ (void)setCornerRadius:(UIView *)view
      cornerRadiusValue:(NSInteger)value;

/**
 设置TextField placeholder 颜色，字体大小
 */
+ (void)setPlaceholderColor:(UIColor *)color
                   fontSize:(CGFloat)fonSize
                  textField:(UITextField *)textField;

/**
 设置TextField placeholder 某部分字的颜色[string]
 */
+ (void)setPlaceholderColor:(UIColor *)color
                     string:(NSString *)str
                   fontSize:(CGFloat)fonSize
                  textField:(UITextField *)textField;

/**
 设置TextField placeholder 某部分字的颜色[NSRange]
 */
+ (void)setPlaceholderColor:(UIColor *)color
                      range:(NSRange)range
                   fontSize:(CGFloat)fonSize
                  textField:(UITextField *)textField;

/**
 显示tabBar
 */
+ (void)showTabBar:(UITabBarController *)tabBarController;

/**
 隐藏tabBar
 */
+ (void)hiddenTabBar:(UITabBarController *)tabBarController;

#pragma mark - MJAutoDisappearTipView[自定义N秒后消失的提示框]

/**
 自定义提示框，默认2秒后消失
 */
+ (void)showMJTipView:(NSString *)text;

/**
 自定义提示框
 
 @param text 提示文本
 @param time 提示框几秒后消失
 @param alignment 提示框位置[居上，居中，居下]，默认居中
 */
+ (void)showMJTipView:(NSString *)text
          displayTime:(CGFloat)time
            alignment:(MJ_Alignment)alignment;

#pragma mark - MJCountdownButton[自定义倒计时按钮]

/**
 自定义倒计时按钮
 
 @param supButton 倒计时按钮
 @param totalTime 倒计时时间[60]
 @param textColor 文本颜色
 @param textFont  文本字体
 @param timeAfterText 秒数后拼接的字符串[@" 秒后重发"]
 */
+ (void)startCountdownAtButton:(UIButton *)supButton
                     totalTime:(NSInteger)totalTime
                     textColor:(UIColor *)textColor
                      textFont:(UIFont *)textFont
                 timeAfterText:(NSString *)timeAfterText;

#pragma mark UILabel

/**
 创建Label[文字,字号,frame]
 */
+ (UILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size
                     frame:(CGRect)frame;

/**
 创建Label[文字,字号,字色,frame]
 */
+ (UILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size
                 textColor:(UIColor *)textColor
                     frame:(CGRect)frame;

/**
 创建Label[文字,字号,字色,行数,frame]
 */
+ (UILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
                     frame:(CGRect)frame;

/**
 创建Label[文字,字号,字色,行数,对其,背景色,frame]
 */
+ (UILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
             textAlignment:(NSTextAlignment)textAlignment
           backgroundColor:(UIColor *)backgroundColor
                     frame:(CGRect)frame;

#pragma mark - UIButton

/**
 创建UIButton[文字,字号,字色,默认图片,选中图片,frame]
 */
+ (UIButton *)buttonWithText:(NSString *)text
                    fontSize:(CGFloat)size
                   textColor:(UIColor *)textColor
                 normalImage:(NSString *)normalImage
               selectedImage:(NSString *)selectedImage
                       frame:(CGRect)rect;

#pragma mark - Image Funtions

/**
 压缩图片
 */
+ (NSData *)compressImage:(UIImage *)image
           toMaxImageSize:(NSInteger)maxImageSize;

/**
 修复图片朝向
 */
+ (UIImage *)fixImageOrientation:(UIImage *)aImage;

/**
 根据颜色生成图片对象
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;

/**
 根据View 获取Image [屏幕截屏可用此方法]
 */
+ (UIImage *)getImageFromView:(UIView *)view;

/**
 根据图片url获取图片尺寸
 //http://blog.csdn.net/zhonggaorong/article/details/50563242
 */
+ (CGSize)getImageSizeWithURL:(id)imageURL;

#pragma mark - UIColor Funtions

//颜色
#define kRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor kRGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

/**
 从十六进制字符串获取颜色
 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色
 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度
 */
+ (UIColor *)colorWithHexString:(NSString *)color
                          alpha:(CGFloat)alpha;

/**
 颜色转换十六进制字符串
 */
+ (NSString *)hexFromUIColor:(UIColor*)color;

#pragma mark - NSString Funtions

/**
 中文转拼音[symbol:是否带音标]
 */
+ (NSString *)transform:(NSString *)chinese
           isNeedSymbol:(BOOL)symbol;

/**
 字符串反转
 */
+ (NSString *)reverseWordsInString:(NSString *)str;

/**
 字节数转字符串（KB,MB,GB,TB）
 */
+ (NSString *)fileSizeToString:(unsigned long long)fileSize;

/**
 字符串是否包含
 */
+ (BOOL)isContainsString:(NSString *)str
           compareString:(NSString *)compareStr;

/**
 去除字符串首尾空格
 */
+ (NSString *)cutForeAndAftSpac:(NSString *)str;

#pragma mark - NSDictionary Funtions

/**
 更改字典键
 */
+ (NSDictionary *)changeDictionaryKey:(NSDictionary *)dic
                                  key:(NSString *)key
                               newKey:(NSString *)newKey;

/**
 计算文件夹下文件的总大小
 */
- (float)fileSizeForDir:(NSString*)path;

#pragma mark - NSDate Funtions

/**
 默认的时间格式[yyyy-MM-dd HH:mm:ss]
 */
+ (NSString *)defaultFormater;

/**
 NSDate-->时间戳[注意:如果stamp=0,请确保(date[时间],formaterStr[时间格式])正确!]
 */
+ (NSString *)stampByDate:(NSDate *)date
                 formater:(NSString *)formaterStr;

/**
 时间戳-->字符串
 */
+ (NSString *)dateStringByStamp:(NSString *)stamp
                       formater:(NSString *)formaterStr;

/**
 字符串-->NSDate[注意:传入的字符串中，应为"2016-05-21 05:24:12"格式，不能为"2016年05月21日 05时24分12秒"]
 */
+ (NSDate *)dateByString:(NSString *)str
                formater:(NSString *)formaterStr;

/**
 NSDate-->字符串
 */
+ (NSString *)dateStringByDate:(NSDate *)date
                      formater:(NSString *)formaterStr;

/**
 获取传入日期date几天前(dayCount<0)或几天后(dayCount>0)的时间字符串
 */
+ (NSString *)dateStirngByDate:(NSDate *)date
                      dayCount:(NSInteger)dayCount
                      formater:(NSString *)formaterStr;

/**
 NSDate-->星期几
 */
+ (NSString *)weakStringByDate:(NSDate *)date;

/**
 获取传入日期所在周的数组，数组0:周一，1:周日
 */
+ (NSArray *)mondayAndSundayArrayByDate:(NSDate *)date;

#pragma mark - Regular Expressions[正则表达式]

/**
 判断传入的数据在传入的正则表达式中是否正确
 */
+ (BOOL)isRightExpression:(NSString *)expression
                    value:(NSString *)value;

/**
 手机号[@"^1(3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$"]
 */
+ (BOOL)isMobileNumber:(NSString *)value;

/**
 中国移动(China Mobile)[@"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"]
 //134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
 */
+ (BOOL)isChinaMobile:(NSString *)phoneNum;

/**
 中国联通(China Unicom)[@"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"]
 //130,131,132,155,156,185,186,145,176,1709
 */
+ (BOOL)isChinaUnicom:(NSString *)phoneNum;

/**
 中国电信(China Telecom)[@"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"]
 //133,153,180,181,189,177,1700
 */
+ (BOOL)isChinaTelecom:(NSString *)phoneNum;

/**
 手机运营商[中国移动,中国联通,中国电信]
 */
+ (NSString *)getPhoneNumType:(NSString *)phoneNum;

/**
 是否为邮箱
 */
+ (BOOL)isEmail:(NSString *)email;

/**
 是否为身份证号[15或18 位]
 */
+ (BOOL)isIdCard:(NSString *)idCard;

/**
 加权因子判断身份证号[15或18 位]
 */
+ (BOOL)isIdCard2:(NSString *)idCard;

/**
 是否是中文[@"^[\\u4e00-\\u9fa5]{0,}$"]
 */
+ (BOOL)isChinese:(NSString *)value;

/**
 金额校验，精确到2位小数[@"^[0-9]+(.[0-9]{2})?$"]
 */
+ (BOOL)isMoney:(NSString *)value;

/**
 车牌号码[@"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$"]
 */
+ (BOOL)isCarNo:(NSString *)carNum;

/**
 用户名[字母，数字(长度4-20)]
 */
+ (BOOL)isUserName:(NSString *)username;

/**
 密码[字母，数字(长度6-20)]
 */
+ (BOOL)isPassword:(NSString *)pwd;

#pragma mark - UserDefault IO

/**
 插入数据[NSUserDefault]
 */
+ (void)setUserDefault:(NSString *)value
                   key:(NSString *)key;

/**
 获取数据[NSUserDefault]
 */
+ (NSString *)getUserDefault:(NSString *)key;

/**
 获取数据[NSUserDefault]如果该key不存在，设置初始值
 */
+ (NSString *)getUserDefaultByKey:(NSString *)key
             ifKeyNoExistSetValue:(NSString *)value;

/**
 删除数据[NSUserDefault]根据Key
 */
+ (void)delUserDefault:(NSString *)key;

#pragma mark - The Data IsNSNull

/**
 数据是否为空
 */
+ (BOOL)isNSNull:(id)data;

#pragma mark - Plist IO

/**
 获取NSUserDefault所在的路径
 */
+ (NSString *)getNSUserDefaultPath:(NSString *)fileName
                          fileType:(NSString *)type;

/**
 自定义保存数据于Plist文件
 */
+ (void)saveDataToPlist:(NSString *)plistName
             Dictionary:(NSDictionary *)dic;

/**
 读取自定义保存的Plist文件
 */
+ (NSArray *)getDataFromPlist:(NSString *)plistName;

/**
 获取 APP NSUserDefault Plist文件
 */
+ (NSDictionary *)getNSUserDefaultPlist;

#pragma mark - Encryption Funtions[加密，解密算法]

/**
 MD5加密[加密后以小写形式显示密文]
 */
+ (NSString *)MD5:(NSString *)str;

/**
 base64加密
 */
+ (NSString *)base64EncodingWithSourceData:(NSData *)data;

/**
 base64 解密
 */
+ (NSData *)base64DecodingWithString:(NSString *)string;

#pragma mark - Sort Array Funtions

/**
 冒泡排序
 */
+ (NSArray *)sortArrayOfbubble:(NSArray *)array
                      sortType:(SortType)sortType;

#pragma mark - Animation Funtions

/**
 跑马灯动画[当文本长度超出父视图的宽度才会开启动画]
 [一个手机屏幕长度的动画跑完需要的时间[默认10s]
 
 @param supView 父视图
 @param text 文本
 @param color 文本颜色
 @param isCanClick 是否可以点文本暂停动画
 */
+ (void)textRunningAtSuperView:(UIView *)supView
                          text:(NSString *)text
                     textColor:(UIColor *)color
                isCanClickText:(BOOL)isCanClick;

/**
 跑马灯动画[当文本长度超出父视图的宽度才会开启动画]
 
 @param supView 父视图
 @param text 文本
 @param color 文本颜色
 @param isCanClick 是否可以点文本暂停动画
 @param oneScreenWidthDuration 一个手机屏幕长度的动画跑完需要的时间[默认10s]
 */
+ (void)textRunningAtSuperView:(UIView *)supView
                          text:(NSString *)text
                     textColor:(UIColor *)color
                isCanClickText:(BOOL)isCanClick
     runOneScreenWidthDuration:(CGFloat)oneScreenWidthDuration;

/**
 暂停跑马灯动画
 */
+ (void)stopTextRunning:(UIView *)view;

/**
 继续跑马灯动画
 */
+ (void)startTextRunning:(UIView *)view;

/**
 移除跑马灯动画
 */
+ (void)removeTextRunning:(UIView *)view;

#pragma mark - 键盘弹出，缩回[动画上移，下移]
/*
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
 */

/**
 键盘弹出
 @param y textField底部 在父视图[self.view]的y坐标[最好加个键盘与textField的缓冲值30].
 */
+ (void)keyboardWillShow:(NSNotification *)notification
               superView:(UIView *)superView yOffset:(CGFloat)y;

/**
 键盘缩回
 */
+ (void)keyboardWillHide:(NSNotification *)notification
               superView:(UIView *)superView;

#pragma mark - Other Funtions

/**
 根据当前索引和一行最多放置个数,计算出当前是第几行.(用于类似朋友圈九宫格图片排放)
 */
+ (NSInteger)getRowIndex:(NSInteger)currentIndex
            maxColNumber:(NSInteger)maxColNum;

@end

#pragma mark - ============自定义延时消失的提示框============

@interface MJAutoDisappearTipView : UIView

/**
 提示框与屏幕的间距
 */
@property (nonatomic, assign)CGFloat spacOfWindow;

/**
 文字与提示框间距
 */
@property (nonatomic, assign)CGFloat spacBetweenTextAndTipView;

/**
 *  提示框弹出
 */
- (void)showMJTipView:(NSString *)text
          displayTime:(CGFloat)time
            alignment:(MJ_Alignment)alignment;

@end

#pragma mark - ============自定义倒计时按钮============

@interface MJCountdownButton : UIButton

+ (void)startCountdownAtButton:(UIButton *)supButton
                     totalTime:(NSInteger)totalTime
                     textColor:(UIColor *)textColor
                      textFont:(UIFont *)textFont
                 timeAfterText:(NSString *)timeAfterText;

@end
