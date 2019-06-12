//
//  ZJAppHelper.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

func ZJ_RootTabBar() -> ZJRootController {
    return AppDelegate.sharedInstance.window?.rootViewController as! ZJRootController
}

func ZJ_RootNav() -> UINavigationController {
    return ZJ_RootTabBar().selectedViewController as! UINavigationController
}

func ZJ_TopVc() -> UIViewController {
    return ZJ_RootNav().children.last!
}
