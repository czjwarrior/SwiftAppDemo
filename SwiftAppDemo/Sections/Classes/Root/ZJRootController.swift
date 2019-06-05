//
//  ZJRootController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class ZJRootController: ZJBaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tabBarImages() -> [String] {
        return ["home", "find", "favor", "me"]
    }
    
    override func tabBarTitles() -> [String] {
        return ["首页", "发现", "最爱", "我的"]
    }
    
    override func tabBarCount() -> Int {
        return 4
    }
    
    override func createViewController(index: Int) -> ZJBaseViewController {
        switch index {
        case 0:
            return ZJHomeController()
        case 1:
            return ZJFindController()
        case 2:
            return ZJFavorController()
        case 3:
            return ZJMineController()
        default:
            return ZJBaseViewController()
        }
    }
    
    override func customTabBarItem() -> ESTabBarItemContentView {
        return ZJBaseTabBarContentView()
    }
}
