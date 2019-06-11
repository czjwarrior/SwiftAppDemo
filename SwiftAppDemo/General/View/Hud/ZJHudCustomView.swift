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
        let label = UILabel(font: UIFont.systemFont(ofSize: 13~),
                            color: .white,
                            alignment: .left)
        label.text = self.message
        return label
    }()
    
    lazy var loadingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hud_loading"))
        
        imageView.layer.removeAllAnimations()
        let ca = CABasicAnimation()
        ca.keyPath = "transform.rotation.z"
        ca.fromValue = NSNumber(value: 0.0)
        ca.toValue = NSNumber(value: Float.pi * 2)
        ca.autoreverses = false
        ca.repeatCount = MAXFLOAT
        ca.duration = 0.8
        ca.isRemovedOnCompletion = false
        
        imageView.layer.add(ca, forKey: "z")
        
        return imageView
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZJHudCustomView {
    func createUI() {
        
        if self.hudType == .loading {
            self.addSubview(self.loadingImageView)
            
            self.loadingImageView.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize(width: 45, height: 45)~)
                make.center.equalToSuperview()
            }
            
        } else {
            self.addSubview(self.bgImageView)
            self.bgImageView.addSubview(self.typeImageView)
            self.bgImageView.addSubview(self.titleLabel)
            
            self.typeImageView.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize(width: 25, height: 25)~)
                make.left.equalToSuperview().offset(15~)
                make.centerY.equalToSuperview()
            }
            
            self.titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.typeImageView.snp.right).offset(12~)
                make.right.equalToSuperview().offset(-15~)
                make.centerY.equalTo(self.typeImageView.snp.centerY)
            }
            
            self.bgImageView.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
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
