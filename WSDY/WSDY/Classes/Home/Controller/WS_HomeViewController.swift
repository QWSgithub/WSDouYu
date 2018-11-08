//
//  WS_HomeViewController.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class WS_HomeViewController: UIViewController {

    // MARK:- 懒加载属性
    private lazy var pageTitleView : WS_PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y:   WS_NavigationBarH, width: WS_ScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = WS_PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView: WS_PageContentView = {[weak self] in
        let contentH = WS_ScreenH - WS_NavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: WS_NavigationBarH + kTitleViewH, width: WS_ScreenW, height: contentH)
        
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = WS_PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        //设置UI界面
        setupUI()
       
    }
    
}

// MARK:- 设置UI界面
extension WS_HomeViewController {
    
    private func setupUI(){
        
        //不需要调整scrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setUpNavgationBar()
        
        //添加titleView
        view.addSubview(pageTitleView)
        
        //添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
        
    }
    
    private func setUpNavgationBar(){
        
//        let btn = UIButton(type: .custom)
//        btn.setImage(UIImage(named: "logo"), for: .normal)
//        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
      
        
        let size = CGSize(width: 40, height: 40)
    
        /*
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
        historyBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
        historyBtn.frame = CGRect(origin: .zero, size: size)
        let historyItem = UIBarButtonItem(customView: historyBtn)

        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "btn_search"), for: .normal)
        searchBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
        searchBtn.frame = CGRect(origin: .zero, size: size)
        let searchItem = UIBarButtonItem(customView: searchBtn)

        let qrcodeBtn = UIButton()
        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
        qrcodeBtn.frame = CGRect(origin: .zero, size: size)
        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
         */
        
        
        /*
        let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)

        let searchItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)

        let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        */
        
       
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
}

// MARK:- 遵守协议
extension WS_HomeViewController : WS_PageTitleViewDelegate {
    func WS_pageTitleView(titleView: WS_PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }

}


extension WS_HomeViewController : WS_PageContentViewDelegate {
    func WS_pageContentView(contentView: WS_PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    
}
