//
//  WS_CollectionHeaderView.swift
//  WSDY
//
//  Created by JW on 2018/11/8.
//  Copyright © 2018年 JW. All rights reserved.
//

import UIKit

class WS_CollectionHeaderView: UICollectionReusableView {
    
    // MARK:- 控件属性
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    var group: WS_BaseModel? {
        
        didSet {
            
//            if let realItem: WS_YanzhiModel = group as? WS_YanzhiModel {
//
//                titleLabel.text = realItem.my_TagName
//                iconImageView.image = UIImage(named: realItem.my_TagIcon)
//
//            } else if let realItem: WS_YouXiModel = group as? WS_YouXiModel {
//
//                titleLabel.text = realItem.my_TagName
//                iconImageView.image = UIImage(named: realItem.my_TagIcon)
//
//            } else if let realItem: WS_TuijianModel = group as? WS_TuijianModel {
//
//                titleLabel.text = realItem.my_TagName
//                iconImageView.image = UIImage(named: realItem.my_TagIcon)
//            }

            titleLabel.text = group?.my_TagName
            iconImageView.image = UIImage(named: group?.my_TagIcon! ?? "")

            
        }
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
