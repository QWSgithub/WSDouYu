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

private let kNormalItemH = kItemW * 3 / 4

private let kPrettyItemH = kItemW * 4 / 3

private let kHeaderViewH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"

private let kHeaderViewID = "kHeaderViewID"

private let kPrettyCellID = "kPrettyCellID"


class WS_RecommendViewController: UIViewController {
    
    
    private lazy var recommendVM: WS_RecommendViewModel = WS_RecommendViewModel()
    

    private lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: WS_ScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight] //随着父控件扩展
        
        collectionView.register(UINib(nibName: "WS_CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
 
        collectionView.register(UINib(nibName: "WS_CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)

        
        
        //注册头
        collectionView.register(UINib(nibName: "WS_CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)

        collectionView.backgroundColor = UIColor.white
       
        
//         let collectionViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - WS_NavigationBarH - WS_TabbarH - 40)
//        collectionView.frame = collectionViewFrame
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        //发送网络请求
        loadData()
    }
    

}


extension WS_RecommendViewController {
    private func setupUI()  {
        view.addSubview(collectionView)
//        collectionView.frame = view.bounds
    }
}

// MARK:- 请求数据
extension WS_RecommendViewController {
    private func loadData() {
        
        
        recommendVM.requestData {
            self.collectionView.reloadData()
        }
        
    }
}


// MARK:- 遵守UICollectionViewDataSource
extension WS_RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommendVM.anchorGroup[section]
        
        let arr:[AnyObject] = group as! [AnyObject]
        
//        print(arr.count)
        return arr.count
        
//        if section == 0 {
//            return 8
//        }
//        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
       
        let group = recommendVM.anchorGroup[indexPath.section]
        
        let arr:[AnyObject] = group as! [AnyObject]
        
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }else{
            return CGSize(width: kItemW, height: kNormalItemH)
        }
    }
    
}

