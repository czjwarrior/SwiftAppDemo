//
//  ZJSecondController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondController: ZJBaseLayoutController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.baseView.showPopBtn()
        self.title = "二级页面"
        
        self.addToContentView(self.secondView)
    }
    
    lazy var secondView: ZJSecondView = {
        let view = ZJSecondView(frame: self.sContentView.bounds)
        return view
    }()

}
