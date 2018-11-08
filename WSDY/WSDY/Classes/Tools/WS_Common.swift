//
//  WS_Common.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

let WS_StatusBarH : CGFloat = UIApplication.shared.statusBarFrame.height
let WS_NavigationBarH : CGFloat = WS_StatusBarH + 40
let WS_TabbarH : CGFloat = (WS_StatusBarH == 44 ? 83 : 49)

let WS_ScreenW = UIScreen.main.bounds.width
let WS_ScreenH = UIScreen.main.bounds.height

//顶部的安全距离
let topSafeAreaHeight = (WS_StatusBarH - 20)
//底部的安全距离
let bottomSafeAreaHeight = (WS_TabbarH - 49)


func WSColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}


