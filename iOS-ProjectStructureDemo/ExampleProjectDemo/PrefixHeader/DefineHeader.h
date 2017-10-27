//
//  DefineHeader.h
//  ExampleProjectDemo
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

//导入预编译的方法

#ifndef DefineHeader_h
#define DefineHeader_h

//打印信息
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

//状态栏高度
#define CUSTOM_STATUSBAR_HEIGHT \
({\
CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];\
StatusRect.size.height;\
})

//底部栏高度
#define CUSTOM_TABBAR_HEIGHT  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//屏幕宽
#define CUSTOM_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

//屏幕高
#define CUSTOM_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//像素转换为字体大小
#define CUSTOM_FONT(value) ([UIFont systemFontOfSize:(value)/2.0])

//像素等比例转换屏幕尺寸
#define CUSTOM_PX(value) ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)

//------------------color----------------
//16进制颜色
#define CUSTOM_COLOR_HEX(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// RGB颜色
#define CUSTOM_COLOR_RGB(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define CUSTOM_COLOR_RANDOM RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//------------------typeof----------------
///弱引用
#define CUSTOM_TYPEWEAK(type)  __weak typeof(type) weak##type = type;

///强引用
#define CUSTOM_TYPESTRONG(type)  __strong typeof(type) type = weak##type;

//------------------APPInfo----------------
///系统版本
#define CUSTOM_APP_DEVICE [[[UIDevice currentDevice] systemVersion] doubleValue]

///app store版本
#define CUSTOM_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
////------------------path----------------
/////拼接Document路径
//#define CUSTOM_PATHDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//
//#define CUSTOM_PATHCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//
////------------------Thread----------------
/////GCD代码只执行一次
//#define CUSTOM_DISPATCH_ONCE(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//
/////在主线程上运行
//#define CUSTOM_DISPATCH_MAIN(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//
/////开启异步线程
//#define CUSTOM_DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#endif /* DefineHeader_h */
