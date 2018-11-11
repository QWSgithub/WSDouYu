//
//  WS_CollectionNormalCell.swift
//  WSDY
//
//  Created by WS on 2018/11/8.
//  Copyright © 2018 JW. All rights reserved.
//

import UIKit

class WS_CollectionNormalCell: UICollectionViewCell {

    @IBOutlet weak var romeNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
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
            romeNameLabel.text = anch.room_name
            print(anch.vertical_src as Any)
            
            var imageString: String = anch.vertical_src!
            
            if imageString.hasSuffix("/day1"){

                let index = imageString.index(imageString.startIndex, offsetBy: 0)
                let endIndex = imageString.index(imageString.endIndex, offsetBy:-4)
                imageString = String(imageString[index ..< endIndex])
            }
            
            
            let url = URL(string: imageString)
            iconImageView.kf.setImage(with: url)
            
        }

    }
    
    
    var youXiModel: WS_NewNorMalMode? {
        didSet {
            guard let anch = youXiModel else {
                return
            }
            
//            romeNameLabel: UILabel!
//            onlineBtn: UIButton!
            let url = URL(string: anch.icon_url!)
            iconImageView.kf.setImage(with: url)
//            nickNameLabel: UILabel!


        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
