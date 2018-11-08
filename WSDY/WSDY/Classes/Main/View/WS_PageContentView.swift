//
//  WS_PageContentView.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

protocol WS_PageContentViewDelegate : class{
    func WS_pageContentView(contentView: WS_PageContentView,progress: CGFloat,sourceIndex: Int,targetIndex: Int);
}

private let ContentCellID = "ContentCellID"

class WS_PageContentView: UIView {

    // MARK:- 定义属性
    private var childVcs: [UIViewController]
    
    private weak var parentViewController: UIViewController?
    
    private var startOfsetX :CGFloat = 0
    
    private var isForbidScrollDelegate: Bool = false //禁止f执行代理事件
    
    weak var delegate: WS_PageContentViewDelegate?
    
    private lazy var collectionView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.yellow
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        
      
        
        return collectionView
    }()
    
    
    // MARK:- 自定义构造函数
    init(frame: CGRect,childVcs:[UIViewController],parentViewController: UIViewController? ) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
extension WS_PageContentView {
    private func setupUI(){
        //将所有子控制器添加到父控制器中
        for childVc in childVcs {
            parentViewController?.addChild(childVc)
        }
        
        addSubview(collectionView)
        collectionView.frame = bounds
        
    }
    
}

extension WS_PageContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        
        childVc.view.backgroundColor  = UIColor.blue
        
        cell.contentView.addSubview(childVc.view)
        return cell
        
    }

}

extension WS_PageContentView : UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidScrollDelegate = false
        
        startOfsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //判断是否是点击事件引起的滚动
        if isForbidScrollDelegate {
            return
        }
        
        var progress: CGFloat = 0
        var sourceIndex: Int = 0
        var targetIndex: Int = 0
        
        //判断是左滑还是右滑
        let currentOfsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        
        if currentOfsetX > startOfsetX {
            //左滑 floor 向下取整
            progress = currentOfsetX / scrollViewW - floor(currentOfsetX / scrollViewW)
            sourceIndex = Int(currentOfsetX / scrollViewW)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            
            //如果完全滑过去
            if currentOfsetX - startOfsetX == scrollViewW {
                progress = 1
                targetIndex = sourceIndex
            }
            
        }else{
            //右滑
            progress = 1 - (currentOfsetX / scrollViewW - floor(currentOfsetX / scrollViewW))
            targetIndex = Int(currentOfsetX / scrollViewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
        }
        
        //传递给titleView
       delegate?.WS_pageContentView(contentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        
        
    }
}


// MARK:- 对外暴露的方法
extension WS_PageContentView {
    func setCurrentIndex(currentIndex: Int)  {
        
        //需要禁止执行代理方法
        isForbidScrollDelegate = true
        
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}


