//
//  WS_RecommendViewController.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit


private let kItemMargin: CGFloat = 10

private let kItemW = (WS_ScreenW - 3*kItemMargin)/2

private let kItemH = kItemW * 3 / 4

private let kHeaderViewH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"

private let kHeaderViewID = "kHeaderViewID"

class WS_RecommendViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: WS_ScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight] //随着父控件扩展
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
 
        //注册头
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.backgroundColor = UIColor.red
//         let collectionViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - WS_NavigationBarH - WS_TabbarH - 40)
//        collectionView.frame = collectionViewFrame
        
        
        
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        view.backgroundColor = UIColor.cyan
    }
    

}


extension WS_RecommendViewController {
    private func setupUI()  {
        view.addSubview(collectionView)
//        collectionView.frame = view.bounds
    }
}

// MARK:- 遵守UICollectionViewDataSource
extension WS_RecommendViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        headerView.backgroundColor = UIColor.randomColor()
        return headerView
    }
    
    
}

