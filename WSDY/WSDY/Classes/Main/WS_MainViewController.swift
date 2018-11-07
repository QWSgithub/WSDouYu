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

        let childVc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()!
        addChild(childVc)
        
        let childVc2 = UIStoryboard(name: "Live", bundle: nil).instantiateInitialViewController()!
        addChild(childVc2)

        let childVc3 = UIStoryboard(name: "Follow", bundle: nil).instantiateInitialViewController()!
        addChild(childVc3)
        
        
        let childVc4 = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController()!
        addChild(childVc4)

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
