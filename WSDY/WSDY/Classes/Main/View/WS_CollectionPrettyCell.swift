//
//  WS_CollectionPrettyCell.swift
//  WSDY
//
//  Created by WS on 2018/11/8.
//  Copyright © 2018 JW. All rights reserved.
//

import UIKit

import Kingfisher

class WS_CollectionPrettyCell: UICollectionViewCell {
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    // MARK:- 定义模型属性
    var anchor: WS_NewNorMalMode? {
        didSet {
            //校验模型是有值
            guard let anch = anchor else {
                return
            }
            
            var onlineStr: String = ""
            if anch.online! >= 10000 {
                onlineStr = "\(Int(anch.online! / 10000))万在线"
            }else {
                onlineStr = "\(anch.online!)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            nickNameLabel.text = anch.nickname
            cityBtn.setTitle(anch.anchor_city, for: .normal)
            
            let url = URL(string: anch.vertical_src!)
            iconImageView.kf.setImage(with: url)
            
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
