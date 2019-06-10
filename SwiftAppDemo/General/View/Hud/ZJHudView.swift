//
//  ZJHudView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import PKHUD

class ZJHudView: PKHUD {
    
    init(type: ZJHudType, message: String) {
        super.init()
        
        self.viewToPresentOn = UIApplication.shared.keyWindow!
        self.contentView = ZJHudCustomView(type: type, message: message)
        self.show()
        self.hide(afterDelay: 2.0)
        
        
    
    }
    
    @discardableResult
    class func zjShowHud(hudType: ZJHudType, message: String = "") -> ZJHudView {
        let hudView = ZJHudView(type: hudType, message: message)
        
        return hudView
    }
}
