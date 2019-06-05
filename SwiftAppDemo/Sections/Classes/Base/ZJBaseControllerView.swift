//
//  ZJBaseControllerView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import SnapKit

enum ZJBaseViewRegion {
    case statusBar      // 状态栏
    case navigationBar  // 导航栏
    case content        // 内容区域
}

class ZJBaseControllerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        
        self.addSubview(self.navView)
        self.addSubview(self.contentView)
        self.bringSubviewToFront(self.navView)
        
        self.navView.addSubview(self.titleLabel)
        self.navView.addSubview(self.popBtn)
        
        self.addSubview(self.statusBarView)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: kStatusBarHeight, left: 60, bottom: 0, right: 60))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var statusBarView: UIView = {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusBarHeight))
        return view
    }()
    
    lazy var navView: UIView = {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kNaviHeight))
        view.backgroundColor = ZJ_WHITE_COLOR
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = ZJ_BOLD_FONT(15)
        label.textColor = ZJ_BLACK_COLOR
        return label
    }()
    
    lazy var popBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitleColor(MC_HEXCOLOR_STR("191919"), for: .normal)
        button.setTitleColor(MC_HEXCOLOR_STR("191919").withAlphaComponent(0.8), for: .highlighted)
        button.titleLabel?.font = ZJ_NORMAL_FONT(12)
        button.setImage(UIImage.init(named: "nav_black_back_btn"), for: .normal)
        button.setImage(UIImage.init(named: "nav_black_back_btns"), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.isHidden = true
        
        button.frame = CGRect(x: -10, y: kStatusBarHeight, w: 64, h: kNaviHeight - kStatusBarHeight)
        
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: CGRect(x: 0, y: kNaviHeight, w: kScreenWidth, h: kScreenHeight - kNaviHeight))
        view.backgroundColor = MC_HEXCOLOR_STR("f4f5f6")
        return view
    }()
    
    @discardableResult
    func showPopBtn() -> UIButton {
        return self.showPopBtnWithTitle(title: "")
    }
    
    @discardableResult
    func showPopBtnWithTitle(title: String) -> UIButton {
        self.popBtn.isHidden = false
        if !title.isEmpty {
            self.popBtn.setTitle(title, for: .normal)
            self.popBtn.left = 4
        }
        return self.popBtn
    }
    
    func addToContentView(_ view: UIView) {
        self.contentView.addSubview(view)
    }
    
    func viewInRegion(region: ZJBaseViewRegion) -> UIView {
        switch region {
        case .statusBar:
            return self.statusBarView
        case .navigationBar:
            return self.navView
        case .content:
            return self.contentView
        }
    }
}
