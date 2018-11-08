//
//  WS_PageTitleView.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

protocol WS_PageTitleViewDelegate: class {
    func WS_pageTitleView(titleView: WS_PageTitleView,selectedIndex index: Int)
}


private let kScrollLineH : CGFloat = 2.0

class WS_PageTitleView: UIView {
    
    
    // MARK:- 定义属性
    private var currentIndex: Int = 0 //当前的index
    
    private var titles: [String]
    
    weak var delegate : WS_PageTitleViewDelegate?
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    
    
    // MARK:- 懒加载
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.frame = bounds
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    // MARK:- 自定义构造函数    
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK:- 设置UI界面
extension WS_PageTitleView {
    private func setupUI(){
        addSubview(scrollView)
        
        //添加title对应的Label
        setupTitleLabels()
        
        //设置底线和滚动滑块
        setUpBottomLineAndScrollLine()
        
    }
    
    private func setupTitleLabels(){
        
        let labelW : CGFloat = frame.width/CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            
            let labelX : CGFloat = labelW * CGFloat(index)
            
            let label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
   
            scrollView.addSubview(label)
            titleLabels.append(label)
            
//            label.isUserInteractionEnabled = true
//            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(tapGes:)))
//            label.addGestureRecognizer(tapGes)
            
            label.ws_addTarget(self, action: #selector(titleLabelClick(tapGes:)))

            
        }
    }
    
    private func setUpBottomLineAndScrollLine(){
        let lineH : CGFloat = 0.5

        let bottomLine = UIView(frame: CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH))
        bottomLine.backgroundColor = UIColor.lightGray
        
        addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange

        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        scrollView.addSubview(scrollLine)
    }
    
}

// MARK:- 监听label的点击
extension WS_PageTitleView {
    @objc private func titleLabelClick(tapGes : UITapGestureRecognizer){
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        let oldLabel = titleLabels[currentIndex]
        
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        currentIndex = currentLabel.tag
        
        //滚动条
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        //通知代理
        delegate?.WS_pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

// MARK:- 对外暴露方法
extension WS_PageTitleView {
    func setTitleWithProgress(progress: CGFloat,sourceIndex: Int, targetIndex: Int) {
        
    }
}
