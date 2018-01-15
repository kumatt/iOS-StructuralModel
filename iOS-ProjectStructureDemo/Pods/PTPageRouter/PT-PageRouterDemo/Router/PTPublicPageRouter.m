//
//  PTPublicPageRouter.m
//  PT-PrefixHeaderDemo
//
//  Created by BlanBok on 2017/12/17.
//  Copyright © 2017年 OComme. All rights reserved.
//

#import "PTPublicPageRouter.h"

@implementation PTPublicPageRouter

+ (void)OpenUrl:(NSURL *)url FormData:(NSDictionary *)formData Animated:(BOOL)animated
{
    NSAssert([url isKindOfClass:[NSURL class]], @"目标路径不可用");
    
    Class targetClass = [self Parse_targetClassWithUrl:url FormData:formData];
    UIViewController<PTPublicPageRouterDelegate> *targetVc = [targetClass new];
    if(formData){
        NSAssert([targetClass conformsToProtocol:@protocol(PTPublicPageRouterDelegate)], @"模块中的目标viewController需遵循跳转协议 PTPublicPageRouterDelegate");
        [targetVc router_setParamentDict:formData];
    }
    [[self CurrentViewController].navigationController pushViewController:targetVc animated:animated];
    
    
    NSString *descript = [self Parse_regisistDataWithUrl:url][PTPublicPageRouterKeyDescrip];
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithDictionary:formData];
    if (formData[PTPublicPageRouterKeyDescrip] == nil && descript) {
        infoDict[PTPublicPageRouterKeyDescrip] = descript;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:PTPublicPageRouterNotification object:targetVc userInfo:infoDict];
}

#pragma mark-parse

/**
 获取目标类名
 
 @param url 路径
 @param formData 附加数据
 @return 控制器类名
 */
+ (Class)Parse_targetClassWithUrl:(NSURL*)url FormData:(NSDictionary*)formData
{
    NSDictionary *configureDict = [self Parse_configureDataWithUrl:url];
    NSDictionary *requireDict = [self Parse_regisistDataWithUrl:url][PTPublicPageRouterKeyRequire];
    NSAssert((requireDict.count == 0) || [[NSSet setWithArray:requireDict.allKeys]isSubsetOfSet:[NSSet setWithArray:formData.allKeys]], @"导入数据需包含-PTPublicPageRouterKeyRequire-所规定的值");
    
    NSString *className = configureDict[PTPublicPageRouterKeyClass];
    NSAssert(NSClassFromString(className), @"目标模块-PTPublicPageRouterKeyClass-信息配置错误或未导入目标模块");
    
    return NSClassFromString(className);
}


/**
 获取配置参数
 
 @param url 请求路径
 @return 配置参数（类名和注册表单中相应描述的位置）
 */
+ (NSDictionary*)Parse_configureDataWithUrl:(NSURL*)url
{
    NSString *path = url.path;
    NSArray *firstArray = [url.resourceSpecifier componentsSeparatedByString:@"?"];
    NSAssert(firstArray.count >= 2, @"必填项漏填");
    
    NSString *parameterString = firstArray[1];
    NSAssert(path.length&&parameterString.length, @"必填项漏填");
    
    NSArray *dictArray = [parameterString componentsSeparatedByString:@"&"];
    NSMutableDictionary *configureDict = [NSMutableDictionary new];
    for (NSString * paramentStr in dictArray) {
        if ([paramentStr containsString:@"="] == NO) {
            continue;
        }
        NSArray *paramentArray = [paramentStr componentsSeparatedByString:@"="];
        NSString *valueObject = paramentArray.lastObject;
        if ([valueObject isKindOfClass:[NSString class]]) {
            valueObject = [valueObject stringByRemovingPercentEncoding];
        }
        
        configureDict[paramentArray.firstObject] = valueObject;
    }
    
    NSAssert(configureDict[PTPublicPageRouterKeyPath] && [configureDict[PTPublicPageRouterKeyPath] length], @"必填项-PTPublicPageRouterKeyPath- 漏填");
    NSAssert(configureDict[PTPublicPageRouterKeyClass] && [configureDict[PTPublicPageRouterKeyClass] length], @"必填项-PTPublicPageRouterKeyClass- 漏填");
    return configureDict;
}

/**
 获取注册表单中对应的描述
 
 @param url 请求路径
 @return 存储在表单中的相应描述
 */
+ (NSDictionary*)Parse_regisistDataWithUrl:(NSURL*)url
{
    NSDictionary *configureDict = [self Parse_configureDataWithUrl:url];
    NSString *filePath  = url.path;
    NSString *keyPath   = configureDict[PTPublicPageRouterKeyPath];
    
    NSDictionary *fileData =  [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSAssert([fileData isKindOfClass:[NSDictionary class]], @"plist文件内的数据，必须为字典");
    
    NSArray *fileArray = [keyPath componentsSeparatedByString:@"/"];
    NSDictionary *entity = fileData;
    for (NSUInteger idx = 0; idx < fileArray.count; idx ++) {
        NSString *key = fileArray[idx];
        NSAssert(entity[key], @"PTPublicPageRouterKeyPath 不可用");
        entity = entity[key];
    }
    return entity;
}

#pragma mark-getViewController
+ (UIViewController*)CurrentViewController {
    UIViewController *resultVC;
    resultVC = [self _currentViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _currentViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_currentViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _currentViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _currentViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
