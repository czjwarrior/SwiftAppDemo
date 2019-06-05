//
//  ZJBaseViewController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    // 处理重复点击tabBar事件 <前提：该ZJBaseViewController为根视图>
    func handleTabBarRootMutiClicked() {
        
    }

}
