//
//  WS_NetworkTools.swift
//  WSDY
//
//  Created by WS on 2018/11/8.
//  Copyright © 2018 JW. All rights reserved.
//

import UIKit

import HandyJSON

import Alamofire

enum WS_HTTPMethod {
    case WS_GET, WS_HEAD, WS_POST, WS_PUT, WS_PATCH, WS_DELETE, WS_TRACE, WS_CONNECT
}

class WS_NetworkTools {

    
    static let sharedInstance = WS_NetworkTools()
    
    
    //获取游戏数据
//    class func getYouXiData(UrlString: String,method: WS_HTTPMethod? = nil, params: [String : Any]? = nil,encoding: ParameterEncoding? = nil,headers: HTTPHeaders? = nil,success:@escaping(_ response: AnyObject)->(),failure:@escaping(_ error: Error?)->()){
//
//        WS_NetworkTools.sharedInstance.getRequest(UrlString: UrlString, method: method ?? WS_HTTPMethod.WS_POST, params: params,encoding:encoding ?? URLEncoding.default,headers: headers, success: { (response) in
//            success(response)
//        }) { (error) in
//            failure(error)
//        }
//    }
    
    
    
    
    //通用接口 变化较大
    class func requestData(UrlString: String,method: WS_HTTPMethod? = nil, params: [String : Any]? = nil,encoding: ParameterEncoding? = nil,headers: HTTPHeaders? = nil,success:@escaping(_ response: AnyObject)->(),failure:@escaping(_ error: Error?)->()){

        WS_NetworkTools.sharedInstance.getRequest(UrlString: UrlString, method: method ?? WS_HTTPMethod.WS_POST, params: params,encoding:encoding ?? URLEncoding.default,headers: headers, success: { (response) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
    
}

extension WS_NetworkTools {
    
    private func getRequest(UrlString: String,method: WS_HTTPMethod, params: [String : Any]? = nil, encoding: ParameterEncoding, headers: HTTPHeaders? = nil, success:@escaping(_ response: AnyObject)->(),failure: @escaping(_ error: Error?)->())  {
    
        var httpMethod: HTTPMethod

        switch method { 
        case .WS_GET:
            httpMethod = .get
        case .WS_HEAD:
            httpMethod = .head
        case .WS_POST:
            httpMethod = .post
        case .WS_PUT:
            httpMethod = .put
        case .WS_PATCH:
            httpMethod = .patch
        case .WS_DELETE:
            httpMethod = .delete
        case .WS_TRACE:
            httpMethod = .trace
        case .WS_CONNECT:
            httpMethod = .connect
        }
    
        // MARK:- 获取json
        Alamofire.request(UrlString, method: httpMethod, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {


//                    let obj = WS_AnchorGroup.deserialize(from: jsonString as? NSDictionary)
//                    print(obj?.data[0].tag_name)

//                    let jsonDic: NSDictionary = jsonString as! NSDictionary
//                    let modelArray = JSONDeserializer<WS_AnchorGroup>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
//                    modelArray?.forEach({ (model) in
//                        print(model!.tag_name)
//                    })
                    success(response.result.value as AnyObject)

            }else{

            }
        }
        
        

//        Alamofire.request(UrlString, method: httpMethod, parameters: params, encoding: encoding, headers: headers).responseString { (response) in
//            if response.result.isSuccess {
//                if let jsonString = response.result.value {
//
//                    print("---------------")
//
//                    print(jsonString)
//
//                    print("===============")
//
////                    let obj = WS_AnchorGroup.deserialize(from: jsonString)
////                    print(obj?.data[0].tag_name)
//
//
////                    if let modelArray = JSONDeserializer<WS_AnchorGroup>.deserializeModelArrayFrom(json: jsonString, designatedPath: "data") {
////                        print(modelArray)
////                        modelArray.forEach({ (model) in
////                            print(model!.tag_name)
////                        })
////
////                    }
//
//                }
//
//            }else{
//
//            }
//        }
        
    }
}
