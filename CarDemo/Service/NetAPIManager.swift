
import Moya

typealias FailClosure               = (_ code: String?, _ errorMsg:String?) -> ()
typealias SuccessClosure            = (_ result:AnyObject, _ code: String?) ->()

enum RequestCode:String{
    case FailError = "-1"
    case Success = "0"      //数据请求成功
    case LoginTimeout = "00000001"
}

//MARK:前后端约定的返回数据结构
class ReturnInfo: HandyJSON {
    var result:AnyObject? //若返回无数据，returnObject字段也得带上,可为空值
    var code: String?
    var msg: String?
    required init() {}
}


class NetAPIManager {
    static let sharedManager = NetAPIManager()
    fileprivate init(){}
    
    let requestProvider = MoyaProvider<RequestApi>()
    
    func requestWithTarget(
        _ target:RequestApi,
        successClosure:@escaping SuccessClosure,
        failClosure:@escaping FailClosure
        ){
        
        LLProgressHUD.showLoading("Loading...")
        printLog("\n request target 请求的URL：\(target.baseURL)\(target.path) \n请求的参数\(target.task)")
        _ =  requestProvider.request(target) { (result) in
            
            switch result{
                
            case let .success(response):
                
                _ = response.data
                _ = response.statusCode
                
                let jsonString      = try! response.mapString()
                let info = ReturnInfo.deserialize(from: jsonString)
                printLog("response resCode:\(info?.code) resMsg:\(info?.msg) data:\n\(jsonString)")
                
                if let code = info?.code{
                    
                    guard code == RequestCode.Success.rawValue else{
                        
                        if code == RequestCode.LoginTimeout.rawValue {
//                            UserManager.exitLogin()
                        } else {
                            LLProgressHUD.showInfo((info?.msg)!)
                            failClosure(info?.code,info?.msg)
                        }
                        
                        return
                    }
                    
                }else{
                    LLProgressHUD.showInfo("网络错误")
                    failClosure(info?.code,"网络错误")
                    return
                }
                
                if let endMsg = target.endSuccessMsg{
                    if endMsg == ""{
                        LLProgressHUD.dismissHUD()
                    }else{
                        LLProgressHUD.showSuccess(endMsg)
                    }
                }else{
                    LLProgressHUD.dismissHUD()
                }
                
                let res = info?.result ?? [] as AnyObject
                successClosure(res, info?.code)
                
            case let .failure(error):
                printLog("error:\(error)")
                LLProgressHUD.showInfo("网络错误")
                failClosure("网络错误","网络错误")
                break
            }
        }
    }
    
    
    
    
    /// 图片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: 参数 ["token": "89757", "userid": "nb74110"]
    ///   - images: image数组
    ///   - success: 成功闭包
    ///   - failture: 失败闭包
    static func uploadImageArray(images: [UIImage], success: @escaping (_ response : AnyObject?) -> (), failture : @escaping (_ error : Error)->()) {
        LLProgressHUD.showLoading("正在上传ing...")
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            for (index, value) in images.enumerated() {
                let imageData = UIImageJPEGRepresentation(value, 0.1)
                let fieldStr = "file"+"\(index+1)"
                
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMddHHmmss"
                let str = formatter.string(from: Date())
                let fileName = str+"\(index)"+".jpg"
                
                
                // 以文件流格式上传
                // 批量上传与单张上传，后台语言为java或.net等
                multipartFormData.append(imageData!, withName: fieldStr, fileName: fileName, mimeType: "image/jpeg")
                //                // 单张上传，后台语言为PHP
                //                multipartFormData.append(imageData!, withName: "fileupload", fileName: fileName, mimeType: "image/jpeg")
                //                // 批量上传，后台语言为PHP。 注意：此处服务器需要知道，前台传入的是一个图片数组
                //                multipartFormData.append(imageData!, withName: "fileupload[\(index)]", fileName: fileName, mimeType: "image/jpeg")
            }
        },
                         
                         to: BaseUrl + MAIN_URL + URL_ClientUpload + "?&multi=true&type=0",
                         headers: nil,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    printLog("response = \(response)")
                                    let result = response.result
                                    if result.isSuccess {
                                        success(response.value as AnyObject)
                                    }
                                }
                            case .failure(let encodingError):
                                LLProgressHUD.showError("网络错误")
                                failture(encodingError)
                            }
        }
        )
    }
    
}



