//
//  WS_UIColor-Extension.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    convenience init(r: CGFloat,g: CGFloat,b: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    
    class func randomColor() -> UIColor {
        
         let r: CGFloat = CGFloat(arc4random_uniform(255))
         let g: CGFloat = CGFloat(arc4random_uniform(255))
         let b: CGFloat = CGFloat(arc4random_uniform(255))
        
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    
    

}
