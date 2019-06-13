//
//  ZJHudView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJHudView: MBProgressHUD {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(view: UIView, type: ZJHudType, message: String, animated: Bool = true) {
        super.init(view: view)
        
        self.color = .clear
        self.mode = .customView
        self.removeFromSuperViewOnHide = true
        
        let customView = ZJHudCustomView(type: type, message: message)
        self.customView = customView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    class func zjShowHud(view: UIView, hudType: ZJHudType, message: String = "", _ animated: Bool = true) -> ZJHudView {
        
        let hudView = ZJHudView(view: view, type: hudType, message: message, animated: animated)
        if hudType == .loading {
            hudView.animationType = .fade
            
            hudView.show(animated)
            
        } else {
            hudView.animationType = .zoomIn
            
            hudView.show(animated)
            
            hudView.hide(animated, afterDelay: 1.0)
        }
        view.addSubview(hudView)
        
        return hudView
    }
    
    @discardableResult
    class func zjShowHud(hudType: ZJHudType, message: String = "") -> ZJHudView {
        
        let window = UIApplication.shared.keyWindow
        return self.zjShowHud(view: window!, hudType: hudType, message: message)
    }
}
