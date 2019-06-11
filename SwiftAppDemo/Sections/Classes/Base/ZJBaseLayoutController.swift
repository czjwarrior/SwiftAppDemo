//
//  ZJBaseLayoutController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ZJBaseLayoutController: ZJBaseViewController {
    
    var baseView:ZJBaseControllerView = ZJBaseControllerView()
    
    private var _sContentView: UIView = UIView()
    var sContentView: UIView {
        get {
            return self.baseView.contentView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.changeColorInRegion(region: .navigationBar, color: ZJ_WHITE_COLOR)
        self.baseView.popBtn.rx.tap.subscribe(onNext: { (_) in
            
            self.navigationController?.popViewController(animated: true)
            
        }).disposed(by: rx.disposeBag)
        
        self.rx.observe(String.self, "title").subscribe(onNext: { (title) in
            self.baseView.titleLabel.text = title
        }).disposed(by: rx.disposeBag)
        
    }
    
    override func loadView() {
        self.baseView = ZJBaseControllerView.init(frame: UIScreen.main.bounds)
        self.view = self.baseView
    }
    
    func changeColorInRegion(region: ZJBaseViewRegion, color: UIColor) {
        let targetView = self.baseView.viewInRegion(region: region)
        targetView.backgroundColor = color
    }
    
    func addToContentView(_ view: UIView) {
        self.baseView.addToContentView(view)
    }
}
