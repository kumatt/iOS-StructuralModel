# iOS-StructuralModel

[对应的代码规范](https://ocomme.github.io/post/ios-development/objective-c-coding-standard/)

> 关于 `MVVM`，尽可能多的使用面向协议的思想而非`ReactiveCocoa`来实现。


[v 0.1 的`MVVM`(初始的构建)](https://github.com/OComme/iOS-ProjectStructureDemo/blob/28eefb5dd95c1c9226ef27b51248a8e507343363/README.md)

[v 0.2 的`MVVM`(失败的尝试)](https://github.com/OComme/iOS-ProjectStructureDemo/blob/d491a52ff67097fa7483c4708eedd228976c22e4/README.md)

[v 1.0 的`MVVM`(稳定的版本)](https://github.com/OComme/iOS-ProjectStructureDemo/blob/4319df69cf5224bf39fd98eb5ca188a18288c4fa/README.md)

好架构的标准
- 代码整齐，分类明确，没有common，没有core
- 不用文档，或很少文档，就能让业务方上手
- 思路和方法要统一，尽量不要多元
- 没有横向依赖，万不得已不出现跨层访问
- 对业务方该限制的地方有限制，该灵活的地方要给业务方创造灵活实现的条件
- 易测试，易拓展
- 保持一定量的超前性
- 接口少，接口参数少
- 高性能

以此记录当前使用的项目构架

```Objective-C
    ├── <Router>                 页面跳转规范
    ├── <CodeFeed>               项目构建内容
    ├── <PrefixHeader>           预编译部分
    ├── <Utils>                  仅本项目可用工具
    ├── <Supporting Files>       项目基本配置文件
    └── <Pods（或Carthage）>工程   通用工具
```

![](Asset/sample.gif)

# 1. Router ——页面跳转规范

使用跳转工具[PTPageRouter](https://github.com/OComme/PT-PageRouter)来规范跳转。

# 2. CodeFeed ——项目构建内容

其内部分

```Objective-C
    ├── <EntityCode>        代码实体，主要页面的构建
    └── <PublicCode>        跳转的公共页面
```

内部以`MVVM`构架进行搭建，其下分为

```Objective-C
    ├── <M>  数据模型集合
    ├── <V>  显示层集合
    ├── <VM> 业务模型集合
    └── <C>  存放'M、V、VM'的容器
```

其中

`M`层 以 `瘦Model` 为标准,仅用做数据的存取

`V`层 显示相关的功能组件

- 对于业务较少的 `View`,做简单的封装,仅暴露必要的接口以方便其展示数据的更新。
- 对于业务较多，逻辑复杂的 `View`,设计时需遵循 `面向协议` 的思想，将需要定制的 UI 和逻辑，在其 `delegate`和`dataSource`实现

`VM`层 负责逻辑操作，对对应的`View`做数据做绑定或定制

- 若`View`仅暴露一定的数据接口，则其为 `View`和对应的`Model`进行数据绑定；
- 若`View`使用`面向协议` 的思想来设计，则实现其对应的定制协议，与`View`组合成定制的控件

以上模型均以`Index` 做为访问内部诸项的索引

`C`层，存放'M、V、VM'的容器，实现数据、逻辑的定向绑定。

# 3. PrefixHeader -预编译部分

存放`.pch`文件及其它预编译的文件

例如：

- 宏的定义
- 常用类的引用
- UI原型的属性设置
- 类方法指针的混用以及UI原型的属性设置

......

# 4. Utils -仅本项目可用工具

只适用于当前项目的工具（可以多项目通用的类，应该提取出去，放在托管平台进行维护）

根据功能可以细分为以下几种：

```Objective-C
    ├── <Component>  完全内聚的功能组件（含有自己的M、V、VM的完整组件）
    ├── <Category>   添加便捷调用的拓展方法
    ├── <M>          通用的数据模型
    ├── <V>          通用的显示层
    └── <VM>         通用的业务模型
```
其`M、V、VM`的设计参考 `codeFeed`中的对应模块

# 5. Supporting Files -项目基本配置文件

存放APP的配置文件 `info.plist`、`InfoPlist.strings`、`main.m`、`Appdelegate`

# 6. Pods（或carthage）-通用工具

存放第三方工具及自己托管于第三方平台的通用工具

如`AFNetworking`、`Masonry`、`MJRefresh` ......


