# WKDataManager
A library for processing network requests (based on 'AFNetworking')

如果你想要将这个工具导入你的项目 请使用

`pod 'WKDataManager', :git=> 'https://github.com/OComme/WKDataManager'`

这是一个对'AFNetworking'进行二次封装的工具。

此次封装，基于平时的使用习惯以及对权限分离的执着，主要分以下两个部分；

```
    ├── <WKNetDataModel>    数据请求模型
    └── <WKNetDataManger>   数据请求管理
```

# WKNetDataModel

作为数据请求模型，将所有在HTTP请求中需要的参数和回调都放在这里。

同时，对数据的处理也放在这一部分。

若要使用它，请依据您的习惯，对这两个方法进行重写：

```
/**
 添加本地的数据判断规则

 @param jsonData json处理好的结果数据
 */
- (void)setRulesWithJsonData:(id _Nullable)jsonData;
```

```
/**
 获取数据失败
 */
- (void)sessionFailuredForHTTPRequestWithError:(NSError* _Nullable)error;
```

# WKNetDataManger

数据请求管理

主要用来对`AFNetworking`进行封装处理的类。

所有的数据处理都放在了`WKNetDataModel`中，所以当前类在模型创建好之后直接调用类方法即可。
