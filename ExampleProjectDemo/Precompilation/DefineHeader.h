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


//屏幕宽
#define CUSTOM_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

//屏幕高
#define CUSTOM_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//像素转换为字体大小
#define CUSTOM_FONT(value) ([UIFont systemFontOfSize:(value)/2.0])

//像素等比例转换屏幕尺寸
#define CUSTOM_PX(value) ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)

//16进制颜色
#define CUSTOM_COLOR_HEX(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// RGB颜色
#define CUSTOM_COLOR_RGB(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define CUSTOM_COLOR_RANDOM RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))




#endif /* DefineHeader_h */
