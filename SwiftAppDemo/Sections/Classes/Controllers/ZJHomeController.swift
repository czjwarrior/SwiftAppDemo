//
//  ZJHomeController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ZJHomeController: ZJBaseLayoutController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "首页"
        
        self.addToContentView(self.btnClick)
        
        self.btnClick.rx.tap.subscribe(onNext: { [weak self] (_) in
            self?.navigationController?.pushViewController(ZJSecondController(), animated: true)
        }).disposed(by: rx.disposeBag)
        
        self.btnClick.setPartRoundCorner(corners: [UIRectCorner.topLeft, UIRectCorner.bottomRight], cornerRadius: 20)
    }
    
    lazy var btnClick: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)~
        
        btn.setTitle("测试", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)~
        btn.backgroundColor = UIColor.red
        
        return btn
    }()
    
    override func handleTabBarRootMutiClicked() {
        print("======kkkkk")
    }

}
