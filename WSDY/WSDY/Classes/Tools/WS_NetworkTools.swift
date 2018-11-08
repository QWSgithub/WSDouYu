//
//  WS_NetworkTools.swift
//  WSDY
//
//  Created by WS on 2018/11/8.
//  Copyright © 2018 JW. All rights reserved.
//

import UIKit

import Alamofire


private let NetWorkRequestShareInstance = WS_NetworkTools()

class WS_NetworkTools {

    class var sharedInstance: WS_NetworkTools {
        return NetWorkRequestShareInstance
    }
    
    
}

extension WS_NetworkTools {
    
    func getRequest(UrlString: String,method: HTTPMethod, params: [String : Any]? = nil,success:@escaping(_ response: AnyObject)->(),failure:@escaping(_ error: Error?)->())  {
        Alamofire.request(UrlString, method: method, parameters: params, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
    
            if response.result.isSuccess {
                let value = response.result.value
                success(value as AnyObject)
                
            }else{
                
                failure(response.result.error)

            }

        }
    }
}
