//
//  WS_RecommendViewModel.swift
//  WSDY
//
//  Created by JW on 2018/11/9.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

import HandyJSON

class WS_RecommendViewModel {

    
    lazy var anchorGroup: [AnyObject] = [AnyObject]()
    private lazy var youxiGroup: [WS_YouXiModel] = [WS_YouXiModel]()
    private lazy var tuijianGroup: [WS_TuijianModel] = [WS_TuijianModel]()
    private lazy var yanzhiGroup: [WS_YanzhiModel] = [WS_YanzhiModel]()

    
}


// MARK:- 发送网络请求
extension WS_RecommendViewModel {
    func requestData(finishiCallback:@escaping () -> ()) {
        
        
        let group = DispatchGroup()

        //请求推荐数据
        getTuiJianData(group: group)
        //请求颜值数据
        getYanZhiData(group: group)
        //请求游戏数据
        getYouXiData(group: group)
        
        group.notify(queue: DispatchQueue.main) {
            print("所有数据都请求道")
            
            self.anchorGroup.insert(self.yanzhiGroup as AnyObject, at: 0)
            self.anchorGroup.insert(self.tuijianGroup as AnyObject, at: 0)
            self.anchorGroup.insert(self.youxiGroup as AnyObject, at: 0)
            finishiCallback()
            
        }
        
        
        
        
    }
}


extension WS_RecommendViewModel {
    
    
    // MARK:- 请求推荐数据
    private func getTuiJianData(group: DispatchGroup){
        let url = "http://capi.douyucdn.cn/api/v1/getbigDataRoom"
        
        let params = ["time" : NSDate.getCurrentTime()]
        group.enter()
        WS_NetworkTools.requestData(UrlString: url,method: .WS_GET,params: params, success: { (response) in
            
            let jsonDic: NSDictionary = response as! NSDictionary
            
            
            print("+++++++++++++11111111")
  
            
            if jsonDic.count != 0{
                let modelArray = JSONDeserializer<WS_TuijianModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                modelArray?.forEach({ (model) in
                    self.tuijianGroup.append(model!)
                })
            }
            
            group.leave()
            
        }) { (error) in
            group.leave()
        }
    }
    
    // MARK:-请求颜值数据
    private func getYanZhiData(group: DispatchGroup){
        
        let url = "http://capi.douyucdn.cn/api/v1/getVerticalRoom"
        
        let params = ["limit":"4",
                      "offset":"0",
                      "time":NSDate.getCurrentTime()]
        group.enter()
        WS_NetworkTools.requestData(UrlString: url,method: .WS_GET,params: params, success: { (response) in
            
            let jsonDic: NSDictionary = response as! NSDictionary
            
           
   
            print("+++++++++++++22222222")
            
            if jsonDic.count != 0{
                let modelArray = JSONDeserializer<WS_YanzhiModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                modelArray?.forEach({ (model) in
                    self.yanzhiGroup.append(model!)
                })

            }
            group.leave()
        }) { (error) in
            group.leave()
        }
        
    }
    
    
    
    
    
    
    
    // MARK:- 请求游戏数据
    private func getYouXiData(group: DispatchGroup){
        let url = "http://capi.douyucdn.cn/api/v1/getHotCate"
        
        let params = ["limit":"4",
                      "offset":"0",
                      "time":NSDate.getCurrentTime()]
        group.enter()
        WS_NetworkTools.requestData(UrlString: url,method: .WS_GET,params: params, success: { (response) in
            
             print("+++++++++++++333333333")
            let jsonDic: NSDictionary = response as! NSDictionary
        
            if jsonDic.count != 0{
                let modelArray = JSONDeserializer<WS_YouXiModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                modelArray?.forEach({ (model) in
                   
                    self.youxiGroup.append(model!)
                })
                
            }
            
            group.leave()
        }) { (error) in
            group.leave()
        }
    }
    
}
