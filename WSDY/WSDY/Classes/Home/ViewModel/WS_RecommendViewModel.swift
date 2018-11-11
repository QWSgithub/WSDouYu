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

    lazy var anchorGroup: [WS_BaseModel] = [WS_BaseModel]()

//    private var yanZhiModel: WS_BaseModel = WS_BaseModel()
    
    private var yanZhiModel: WS_BaseModel = WS_BaseModel()
    private var youXiModel: WS_BaseModel = WS_BaseModel()
    private var tuijianModel: WS_BaseModel = WS_BaseModel()
    
    
//    lazy var anchorGroup: [Any] = [Any]()
//    private lazy var youxiGroup: [WS_YouXiModel] = [WS_YouXiModel]()
//    private lazy var tuijianGroup: [WS_TuijianModel] = [WS_TuijianModel]()
//    private lazy var yanzhiGroup: [WS_YanzhiModel] = [WS_YanzhiModel]()

    
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
            
            self.anchorGroup.insert(self.youXiModel, at: 0)
            self.anchorGroup.insert(self.yanZhiModel, at: 0)
            self.anchorGroup.insert(self.tuijianModel, at: 0)
            finishiCallback()
            
        }
        
        
        
        
    }
}


extension WS_RecommendViewModel {
    
    
    // MARK:-请求推荐数据

    
    private func getTuiJianData(group: DispatchGroup){
        let url = "http://capi.douyucdn.cn/api/v1/getbigDataRoom"
    
        let params = ["time" : NSDate.getCurrentTime()]
        group.enter()
        WS_NetworkTools.requestData(UrlString: url,method: .WS_GET,params: params, success: { (response) in
            
            let jsonDic: NSDictionary = response as! NSDictionary

            
//            print("+++++++++++++111111111111")
//            print(jsonDic)

            
            if jsonDic.count != 0{
//                let modelArray = JSONDeserializer<WS_TuijianModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
//                modelArray?.forEach({ (model) in
//                    self.tuijianGroup.append(model!)
//                })
                
                let modelArray = JSONDeserializer<WS_NewNorMalMode>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                
                
                self.tuijianModel.my_TagName = "热门"
                self.tuijianModel.my_TagIcon = "home_header_hot"
                modelArray?.forEach({ (item) in
                    self.tuijianModel.normalGroup.insert(item!, at: 0)
                })
                
            }
            
            
            
            group.leave()
            
        }) { (error) in
            group.leave()
        }
    }
    
    
    // MARK:- 请求颜值数据
    private func getYanZhiData(group: DispatchGroup){
        
        let url = "http://capi.douyucdn.cn/api/v1/getVerticalRoom"

        let params = ["limit":"4",
                      "offset":"0",
                      "time":NSDate.getCurrentTime()]
        group.enter()
        WS_NetworkTools.requestData(UrlString: url,method: .WS_GET,params: params, success: { (response) in
            
            let jsonDic: NSDictionary = response as! NSDictionary
            
//            print("+++++++++++++22222222")
//            print(jsonDic)
            
            
            if jsonDic.count != 0{
//                let modelArray = JSONDeserializer<WS_YanzhiModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
//                modelArray?.forEach({ (model) in
//                    self.yanzhiGroup.append(model!)
//                })
                
                
                let modelArray = JSONDeserializer<WS_NewNorMalMode>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                
                self.yanZhiModel.my_TagName = "颜值"
                self.yanZhiModel.my_TagIcon = "home_header_phone"
                
                modelArray?.forEach({ (item) in
                    self.yanZhiModel.normalGroup.insert(item!, at: 0)
                })
                
                
                
//                mmodel.normalGroup = modelArray as? [WS_NewNorMalMode]
//                self.yanZhiModel = mmodel

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
            
            print(jsonDic)

            
        
            if jsonDic.count != 0{
//                let modelArray = JSONDeserializer<WS_YouXiModel>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
//                modelArray?.forEach({ (model) in
//
//                    self.youxiGroup.append(model!)
//                })
                
                let modelArray = JSONDeserializer<WS_NewNorMalMode>.deserializeModelArrayFrom(array: jsonDic["data"] as? NSArray)
                
                self.youXiModel.my_TagName = "游戏"
                self.youXiModel.my_TagIcon = "home_header_normal"
                modelArray?.forEach({ (item) in
                    self.youXiModel.normalGroup.insert(item!, at: 0)
                })


                
            }
            
            group.leave()
        }) { (error) in
            group.leave()
        }
    }
    
}
