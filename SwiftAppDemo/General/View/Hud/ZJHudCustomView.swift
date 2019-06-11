//
//  ZJHudCustomView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

enum ZJHudType {
    case none
    case loading
    case success
    case fail
    case warning
    case reminder
}

class ZJHudCustomView: UIView {

    var hudType: ZJHudType = .none
    var message = ""

    init(type: ZJHudType, message: String) {
        super.init(frame: .zero)
        
        self.hudType = type
        self.message = message
        
        self.createUI()
    }
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hud_bg"))
        return imageView
    }()
    
    lazy var typeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: self.typeIconImageStr()))
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(font: UIFont.systemFont(ofSize: 12),
                            color: .white,
                            alignment: .left)
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZJHudCustomView {
    func createUI() {
        self.addSubview(self.bgImageView)
        self.bgImageView.addSubview(self.typeImageView)
        self.bgImageView.addSubview(self.titleLabel)
        
        self.typeImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 25, height: 25)~)
            make.left.equalTo(15~)
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.typeImageView.snp.left).offset(12~)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(15~)
        }
        
        self.bgImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func typeIconImageStr() -> String {
        var iconStr = ""
        switch hudType {
        case .none:
            iconStr = ""
        case .loading:
            iconStr = ""
        case .success:
            iconStr = "hud_icon_sucess"
        case .fail:
            iconStr = "hud_icon_error"
        case .warning:
            iconStr = "hud_icon_warning"
        case .reminder:
            iconStr = "hud_icon_remind"
        }
        return iconStr
    }
}
