//
//  ZJRefreshFooter.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import MJRefresh

class ZJRefreshFooter: MJRefreshAutoFooter {

    lazy var label: UILabel = {
        
        let label = UILabel.init()
        label.textColor = UIColor.init(hexString: "75787B")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var loading: UIActivityIndicatorView = {
        
        let loading = UIActivityIndicatorView.init(style: .gray)
        return loading
    }()
}

extension ZJRefreshFooter {
    
    override func prepare() {
        super.prepare()
        // 设置控件的高度
        self.mj_h = 50
        self.addSubview(self.label)
        self.addSubview(self.loading)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        self.label.frame = self.bounds
        self.loading.center = CGPoint.init(x: 30, y: self.mj_h * 0.5)
    }
    
    override var state: MJRefreshState {
        
        didSet {
            guard state != oldValue else {
                return
            }
            
            switch state {
            case .idle:
                self.label.text = "上拉加载更多数据"
                self.loading.stopAnimating()
            case .refreshing:
                self.label.text = "加载数据中"
                self.loading.startAnimating()
            case .noMoreData:
                self.label.text = "没有更多数据了"
                self.loading.stopAnimating()
            default:
                break
            }
        }
    }
}
