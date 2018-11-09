//
//  WS_AnchorGroup.swift
//  WSDY
//
//  Created by JW on 2018/11/9.
//  Copyright © 2018年 JW. All rights reserved.
//

import Foundation

import HandyJSON

struct WS_AnchorGroup: HandyJSON {

}

struct dataModel: HandyJSON {
    var icon_url: String!
    var push_nearby: Int!
    var push_vertical_screen: Int!
    var room_list: room_listModel!
    var small_icon_url: String!
    var tag_id: Int!
    var tag_name: String!
}


struct room_listModel: HandyJSON {
    
    var avatar_mid: String!
    var avatar_small: String!
    var cate_id: Int!
    var game_name: String!
    var hot: Int!
    var isVertical: Int!
    var jumpUrl: String!
    var nickname: String!
    var online: Int!
    var owner_uid: Int!
    var ranktype: Int!
    var rmf1: Int!
    var rmf2: Int!
    var rmf3: Int!
    var rmf4: Int!
    var rmf5: Int!
    var room_id: Int!
    var room_name: String!
    var room_src: String!
    var show_status: Int!
    var show_time: Int!
    var specific_catalog: String!
    var specific_status: Int!
    var vertical_src: String!

    
}

// MARK:- 游戏
struct WS_YouXiModel: HandyJSON {
    
    var icon_url: String!
    var push_nearby: Int!
    var push_vertical_screen: Int!
    var room_list: room_listModel!
    var small_icon_url: String!
    var tag_id: Int!
    var tag_name: String!
}

// MARK:- 颜值
struct WS_YanzhiModel: HandyJSON {
    var anchor_city: String?
    var avatar_mid: String?
    var avatar_small: String?
    var cate_id: Int?
    var child_id: Int?
    var game_name: String?
    var hn: Int?
    var isVertical: Int?
    var is_noble_rec: Int?
    var jumpUrl: String?
    var nickname: String?
    var nrt: Int?
    var online: Int?
    var owner_uid: Int?
    var ranktype: Int?
    var rmf1: Int?
    var rmf2: Int?
    var rmf3: Int?
    var rmf4: Int?
    var rmf5: Int?
    var room_id: Int?
    var room_name: String?
    var room_src: String?
    var show_status: Int?
    var show_time: Int?
    var show_type: Int?
    var specific_catalog: String?
    var specific_status: Int?
    var subject: String?
    var vertical_src: String?
    var vod_quality: Int?
}

// MARK:- 推荐
struct WS_TuijianModel: HandyJSON {
    var avatar_mid: String?
    var avatar_small: String?
    var cate_id: Int?
    var game_name: String?
    var hn: Int?
    var isVertical: Int?
    var jumpUrl: String?
    var nickname: String?
    var nrt: Int?
    var online = 343903;
    var push_ios: Int?
    var push_nearby: Int?
    var ranktype: Int?
    var recomType: Int?
    var rmf1 = 0;
    var rmf2 = 0;
    var rmf3 = 1;
    var rmf4 = 0;
    var rmf5 = 0;
    var room_id: Int?
    var room_name: String?
    var room_src: String?
    var rpos: Int?
    var show_status: Int?
    var vertical_src: String?
}
