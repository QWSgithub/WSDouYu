//
//  WS_UIView_Extension.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK:- 用于给View添加点击事件
    func ws_addTarget(_ target: Any?, action: Selector){
        self.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGes)

    }
}
