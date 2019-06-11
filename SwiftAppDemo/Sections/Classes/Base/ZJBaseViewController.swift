//
//  ZJBaseViewController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class ZJBaseViewController: UIViewController {

    let isLoading = BehaviorRelay(value: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    deinit {
        print("释放了。。。")
    }
    
    // 处理重复点击tabBar事件 <前提：该ZJBaseViewController为根视图>
    func handleTabBarRootMutiClicked() {
        
    }
}

extension ZJBaseViewController: DZNEmptyDataSetSource {
    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        
        let emptyView = ZJEmptyView(frame: self.view.bounds)
        emptyView.update(imageName: self.emptyDataImageName(),
                         title: self.emptyDataTitleStr())
        return emptyView
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -(kScreenHeight / 2 - kNaviHeight) - 20~
    }
    
    @objc func emptyDataImageName() -> String {
        return "zj_default_empty"
    }
    
    @objc func emptyDataTitleStr() -> String {
        return "暂无数据"
    }
}

extension ZJBaseViewController: DZNEmptyDataSetDelegate {
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return !isLoading.value
    }
}
