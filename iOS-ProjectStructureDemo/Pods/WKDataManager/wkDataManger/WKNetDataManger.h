//
//  WKNetDataManger.h
//  WKDataManager
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：admin
 功能描述：网络请求管理
 所处位置：
 创建版本：
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import "WKNetDataModel.h"

@interface WKNetDataManger : NSObject

/**
 POST 请求

 @param dataModel 参数模型
 */
+ (void)POSTDataWithDataModel:(WKNetDataModel*_Nonnull)dataModel;
    
/**
 GET 请求

 @param dataModel 参数模型
 */
+ (void)GETDataWithDataModel:(WKNetDataModel*_Nonnull)dataModel;
    
/**
 delete 请求

 @param dataModel 参数模型
 */
+ (void)DELETEDataWithDataModel:(WKNetDataModel*_Nonnull)dataModel;
    
    
/**
 put 请求

 @param dataModel 参数模型
 */
+ (void)PUTDataWithDataModel:(WKNetDataModel*_Nonnull)dataModel;
    
/**
 上传图片

 @param dataModel 参数模型
 */
+ (void)UPLOADImageWithDataModel:(WKNetDataModel*_Nonnull)dataModel;

    
@end
