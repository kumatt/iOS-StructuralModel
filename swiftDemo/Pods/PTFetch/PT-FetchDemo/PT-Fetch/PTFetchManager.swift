//
//  PTFetchManager.swift
//  PT-FetchDemo
//
//  Created by ZhangJian on 2018/4/17.
//  Copyright © 2018年 Kang. All rights reserved.
//
//数据请求模型

import UIKit
import Alamofire

public class PTFetchManager: NSObject {
    
    //single instance
    static let sharedInstance = PTFetchManager()
    private override init() {} //This prevents others from using the default '()' initializer for this class.
    
    public class func Fetch_PostData(fetchModel:PTFetchModel!) {
        PTFetchManager.sharedInstance.sendRequestWithFetchModel(fetchModel: fetchModel,method: .post)
    }
    
    public class func Fetch_GetData(fetchModel:PTFetchModel!) {
        PTFetchManager.sharedInstance.sendRequestWithFetchModel(fetchModel: fetchModel,method: .get)
    }
    
    public class func Fetch_DeleteData(fetchModel:PTFetchModel!) {
        PTFetchManager.sharedInstance.sendRequestWithFetchModel(fetchModel: fetchModel,method: .delete)
    }
    
    public class func Fetch_PutData(fetchModel:PTFetchModel!) {
        PTFetchManager.sharedInstance.sendRequestWithFetchModel(fetchModel: fetchModel,method: .put)
    }
    
    public class func Fetch_UploadData(fetchModel:PTFetchModel!) {
        PTFetchManager.sharedInstance.upLoadDataWithFetchModel(fetchModel: fetchModel)
    }
    
    //MARK:implementation
    private func sendRequestWithFetchModel(fetchModel:PTFetchModel!,method:HTTPMethod) {
        Alamofire.request(URL.init(string: fetchModel!.urlString)!, method: method, parameters: fetchModel!.paraments).responseData { (resultData) in
            if resultData.result.value != nil{
                fetchModel!.responseObject = resultData.result.value
                return
            }
            fetchModel!.errorInfo = resultData.result.error
        }
    }
    
    private func upLoadDataWithFetchModel(fetchModel:PTFetchModel!) {
        assert(fetchModel!.uploadData != nil,"uploadData can not be nil")
        assert(fetchModel!.uploadName != nil,"uploadName can not be nil")
        assert(fetchModel!.contentType != nil,"contentType can not be nil")
        assert(fetchModel!.mimeType != nil,"mimeType can not be nil")

        let formatter:DateFormatter = DateFormatter.init()
        formatter.dateFormat = "yyyyMMddHHmmss";
        let fileName:String = "\(formatter.string(from: Date.init()))\(String(describing: fetchModel!.contentType))"
        
        //上传数据到服务器
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //采用post表单上传
                // 参数解释：
                //withName:和后台服务器的name要一致 ；fileName:可以充分利用写成用户的id，但是格式要写对； mimeType：规定的，要上传其他格式可以自行百度查一下
                multipartFormData.append(fetchModel!.uploadData!, withName: fetchModel!.uploadName!, fileName: fileName, mimeType: fetchModel!.mimeType!)
                //如果需要上传多个文件,就多添加几个
                //multipartFormData.append(imageData, withName: "file", fileName: "123456.jpg", mimeType: "image/jpeg")
                //......
                
        },to: fetchModel!.urlString,encodingCompletion: { encodingResult in
            
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    if response.result.value != nil {
                        fetchModel!.responseObject = (response.result.value as! Data)
                    }else{
                        fetchModel!.errorInfo = response.result.error
                    }
                }
                //获取上传进度
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    if fetchModel!.progressing != nil {
                        fetchModel!.progressing!(progress.fractionCompleted)
                    }
                }
            case .failure(let encodingError):
                //打印连接失败原因
                fetchModel!.errorInfo = encodingError
            }
        })
        
    }
    
}
