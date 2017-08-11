# MobileProjectArchitectureDemo
About the mobile project architecture built using Objective-C

仅以此，记录下当前想到的比较顺眼项目构架

```
    ├── <AppControl> 直接在APP层面进行操作的模块
    ├── <CodeFeed>（项目真正的构建内容）
    ├── <Precompilation>（预编译文件）
    ├── <Utils>（适用于本项目的自定义类库。根据功能可以细分下去。例如：UI类、Data类、Net类）
    ├── <Supporting Files> (系统配置文件)
    └── <Pods（或Carthage）>工程（第三方SDK以及自己做的小工具）
```

# AppControl 在APP层面进行操作的模块

以`MVVM`构架进行搭建，其下分为

```
    ├── <M> 
    ├── <V>
    └── <VM>（appdelegate也放置在这里）
```

其中

`M`层放置和App相关的模型信息

`V`层放置和App相关的控制器和视图

`VM`层放置处理和App相关的数据处理，其中`AppDelegate`进行逻辑接收。
