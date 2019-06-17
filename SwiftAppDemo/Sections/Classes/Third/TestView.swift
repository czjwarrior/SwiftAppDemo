//
//  TestView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    @IBAction func successClick(_ sender: Any) {
        
        ZJHudView.zjShowHud(hudType: .success, message: "请求成功")
    }
    
    @IBAction func failClick(_ sender: Any) {
        ZJHudView.zjShowHud(hudType: .fail, message: "请求失败")
    }
    
    @IBAction func waringClick(_ sender: Any) {
        ZJHudView.zjShowHud(hudType: .warning, message: "请输入名称")
    }
    
    @IBAction func loadingOnWindowClick(_ sender: Any) {
        ZJHudView.zjShowHud(hudType: .loading)
    }
    
    @IBAction func loadingOnSelf(_ sender: Any) {
        ZJHudView.zjShowHud(view: self, hudType: .loading)
    }
}
