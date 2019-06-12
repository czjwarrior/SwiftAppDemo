//
//  ZJCommonDefine.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import EZSwiftExtensions

/// 屏幕的宽度
let kScreenWidth                     = UIScreen.main.bounds.width

/// 屏幕的高度
let kScreenHeight                    = UIScreen.main.bounds.height

/// 状态栏高度
let kStatusBarHeight: CGFloat        = kIsIPhoneX ? 44 : 20

// TODO: 是否是iphoneX ，需要支持xs，plus
let kIsIPhoneX: Bool                 = kScreenHeight >= 812 ? true : false

// 导航栏高度
let kNaviHeight: CGFloat             = kIsIPhoneX ? 88 : 64

// Tabbar高度
let kTabbarHeight:  CGFloat          = kIsIPhoneX ? 83 : 49

//底部安全高度
let kiPhoneXTabrOffset: CGFloat      = kIsIPhoneX ? 34 : 0

let ZJ_BLACK_COLOR = UIColor.black
let ZJ_WHITE_COLOR = UIColor.white
let ZJ_CLEAR_COLOR = UIColor.clear

func MC_HEXCOLOR_STR(_ hexColor: String!) -> UIColor{
    return UIColor.init(hexString: hexColor)!
}

//字体(系统字体)
func ZJ_NORMAL_FONT(_ fontSize:CGFloat) ->UIFont{
    return UIFont.systemFont(ofSize: fontSize)
}

//粗体(系统加粗)
func ZJ_BOLD_FONT(_ fontSize:CGFloat) ->UIFont{
    return UIFont.boldSystemFont(ofSize: fontSize)
}
