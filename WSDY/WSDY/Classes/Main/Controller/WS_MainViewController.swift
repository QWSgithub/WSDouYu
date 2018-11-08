//
//  WS_MainViewController.swift
//  WSDY
//
//  Created by WS on 2018/11/7.
//  Copyright © 2018 JW. All rights reserved.
//

import UIKit

class WS_MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")

        
        // Do any additional setup after loading the view.
    }
    
    
    private func addChildVc(storyName : String){
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChild(childVc)
    }
    


}
