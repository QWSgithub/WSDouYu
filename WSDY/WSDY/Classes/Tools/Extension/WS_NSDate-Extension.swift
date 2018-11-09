//
//  WS_NSDate-Extension.swift
//  WSDY
//
//  Created by JW on 2018/11/9.
//  Copyright © 2018年 JW. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String{
        
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        
        
        return "\(interval)"
        
    }
    
    
}
