//
//  WKNetDataModel.h
//  WKDataManager
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：admin
 功能描述：创建HTTP请求相关的参数模型
 所处位置：
 创建版本：
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKNetDataModel : NSObject
{
    @protected NSString *_urlString;
    @protected NSDictionary *_parameters;
}

/**
 网络请求路径
 */
@property (nonnull,nonatomic,copy) NSString *urlString;
    
/**
 请求参数
 */
@property (nonnull,nonatomic,strong) NSDictionary *parameters;
    

/**
 请求成功回调
 */
@property (nonatomic,copy) void(^ _Nullable success)(id _Nullable responseObject);

    
/**
 请求失败回调
 */
@property (nonatomic,copy) void(^ _Nullable failure)(id _Nonnull error);
  
/**
 请求进度
 */
@property (nonatomic,copy) void(^ _Nullable progressing)(NSProgress * _Nonnull progress);

  
/**
 处理网络请求结果  （初步处理  ，判断空或者不属于json数据）

 @param responseObject 结果数据
 */
- (void)dealResponseObject:(NSData* _Nullable)responseObject;
    
#pragma mark-option
/**
 上传图片
 */
@property (nullable,nonatomic,weak) UIImage *uploadImage;

/**
 上传图片名（参数）
 */
@property (nullable,nonatomic,copy) NSString *uploadName;

    
#pragma mark-sub class inherit

/**
 添加本地的数据判断规则

 @param jsonData json处理好的结果数据
 */
- (void)setRulesWithJsonData:(id _Nullable)jsonData;
    
/**
 网络请求失败
 */
- (void)sessionFailuredForHTTPRequestWithError:(id _Nullable)error;
    
@end
