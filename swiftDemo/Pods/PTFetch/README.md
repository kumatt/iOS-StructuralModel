# PTFetch
Encapsulation of network data requests

首先，创建一个实现`PTFetchDelegate`代理方法的类

```Swift
/// 拼接请求路径
    func appentUrlWithShortUrl(url:String!) -> String?
    
    /// 拼接配置参数
    func appentParamentsWithShortParament(parament:Dictionary<String,Any>!) -> Dictionary<String,Any>?
    
    /// 根据规则筛选数据
    func dealRulesWith(data:Data,success:FetchBlock,failure:FetchBlock)
    
    ///处理错误信息
    func dealErrorData(error:Any) -> Any

```

并在`AppDelegate`中将其配置给`PTFetchModel`

```Swift
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        PTFetchModel.delegate(delegate: PublicFetchTarget())
        return true
    }
```

之后，便可直接调用`PTFetchManager`来进行数据请求

```Swift
   func fetch() {
      let fetchModel:PTFetchModel = PTFetchModel()
      fetchModel.urlString = "http://www.juyuanche.com/api001/user/userInfo"
      fetchModel.uploadName = "user_picture"
      fetchModel.uploadData = UIImagePNGRepresentation(UIImage.init(named: "关闭")!)
      fetchModel.contentType = "png"
      fetchModel.mimeType = "image/*"
      fetchModel.succeess = succeessWay
      fetchModel.failure  = failure
      PTFetchManager.Fetch_UploadData(fetchModel: fetchModel)
  }

  func succeess(_:Any) {

  }
  func failure(_:Any) {

  }
```
