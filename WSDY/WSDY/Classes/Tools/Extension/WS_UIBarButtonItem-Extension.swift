//
//  WS_UIBarButtonItem-Extension.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createItem(imageName: String,highImageName: String,size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton(frame: CGRect(origin: .zero, size: size))
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        return UIBarButtonItem(customView: btn)
    }
    
    //便利构造函数 1.以convenience开头 2.在构造函数中必须调用一个设计的构造函数
    convenience init(imageName: String,highImageName: String = "",size: CGSize = .zero) {
    
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == .zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
