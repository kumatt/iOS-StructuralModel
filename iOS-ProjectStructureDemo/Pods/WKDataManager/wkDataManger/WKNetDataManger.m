//
//  WKNetDataManger.m
//  WKDataManager
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKNetDataManger.h"
#import "AFNetworking.h"

@interface WKNetDataManger ()
    
/**
  HTTP会话管理
 */
@property (nonnull,nonatomic,strong) AFHTTPSessionManager *sessionManager;
    
@end

@implementation WKNetDataManger
    
+ (WKNetDataManger*)shareNetDataManager
{
    static WKNetDataManger *dataManager = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        dataManager = [[self allocWithZone:NULL] init] ;
    });
    return dataManager;
    
}
    
#pragma mark-API
+ (void)POSTDataWithDataModel:(WKNetDataModel *)dataModel
{
    [[self shareNetDataManager]postDataWithDataModel:dataModel];
}

+ (void)GETDataWithDataModel:(WKNetDataModel *)dataModel
{
    [[self shareNetDataManager]getDataWithDataModel:dataModel];
}

+ (void)DELETEDataWithDataModel:(WKNetDataModel *)dataModel
{
    [[self shareNetDataManager]deleteDataWithDataModel:dataModel];
}

+ (void)PUTDataWithDataModel:(WKNetDataModel *)dataModel
{
    [[self shareNetDataManager]putDataWithDataModel:dataModel];
}
    
+ (void)UPLOADImageWithDataModel:(WKNetDataModel *)dataModel
{
    [[self shareNetDataManager]UpLoadImageWithDataModel:dataModel];

}

#pragma mark-HTTPSession
    
- (void)postDataWithDataModel:(WKNetDataModel *)dataModel
{
    [self.sessionManager POST:dataModel.urlString parameters:dataModel.parameters progress:dataModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [dataModel dealResponseObject:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [dataModel sessionFailuredForHTTPRequestWithError:error];
    }];
}

- (void)getDataWithDataModel:(WKNetDataModel *)dataModel
{
    [self.sessionManager GET:dataModel.urlString parameters:dataModel.parameters progress:dataModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [dataModel dealResponseObject:responseObject];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [dataModel sessionFailuredForHTTPRequestWithError:error];
    }];
}

- (void)deleteDataWithDataModel:(WKNetDataModel *)dataModel
{
    [self.sessionManager DELETE:dataModel.urlString parameters:dataModel.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [dataModel dealResponseObject:responseObject];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [dataModel sessionFailuredForHTTPRequestWithError:error];
    }];
}

- (void)putDataWithDataModel:(WKNetDataModel *)dataModel
{
    [self.sessionManager PUT:dataModel.urlString parameters:dataModel.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [dataModel dealResponseObject:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [dataModel sessionFailuredForHTTPRequestWithError:error];
    }];
}
    
    
- (void)UpLoadImageWithDataModel:(WKNetDataModel *)dataModel
{
    NSAssert(dataModel.uploadImage, @"uploadImage can not be nil");
    NSAssert(dataModel.uploadName, @"uploadName can not be nil");

    NSData *uploadData = [self wl_imageCompressForWidth:dataModel.uploadImage];
    [self.sessionManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@", str,[self contentTypeForImage:dataModel.uploadImage]];
    
    [self.sessionManager POST:dataModel.urlString parameters:dataModel.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadData name:dataModel.uploadName fileName:fileName mimeType:@"image/*"];
    } progress:dataModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [dataModel dealResponseObject:responseObject];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [dataModel sessionFailuredForHTTPRequestWithError:error];
    }];
    
}

#pragma mark-dealData
    /**
     Compressed image upload
     
     @param sourceImage image to compress
     @return image compressed
     */
- (NSData *)wl_imageCompressForWidth:(UIImage *)sourceImage{
    NSData *imgData = UIImageJPEGRepresentation(sourceImage, 1.0);
    
    if ((float)imgData.length/1024 > 1000) {
        imgData = UIImageJPEGRepresentation(sourceImage, 1024*1000.0/(float)imgData.length);
        
        if ((float)imgData.length/1024 > 400) {
            imgData = UIImageJPEGRepresentation(sourceImage, 0.9);
        }
        
    }else{
        if ((float)imgData.length/1024 > 400) {
            imgData = UIImageJPEGRepresentation(sourceImage, 0.9);
        }
    }
    return imgData;
    
}
    
- (NSString *)contentTypeForImage:(UIImage*)image
{
    NSData *data = UIImagePNGRepresentation(image);
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c)
    {
        case 0xFF:
        return @"jpeg";
        
        case 0x89:
        return @"png";
        
        case 0x47:
        return @"gif";
        
        case 0x49:
        case 0x4D:
        return @"tiff";
        
        case 0x52:
        if ([data length] < 12) {
            return nil;
        }
        
        NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
        if ([testString hasPrefix:@"RIFF"]
            && [testString hasSuffix:@"WEBP"])
        {
            return @"webp";
        }
        break;
    }
    
    // nil
    return @"png";
}
    
#pragma mark-lazyload
- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 10;
    }
    return _sessionManager;
}

    
@end
