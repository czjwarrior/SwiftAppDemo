//
//  ZJHudCustomView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import PKHUD

enum ZJHudType {
    case none
    case loading
    case success
    case fail
    case warning
    case reminder
}

class ZJHudCustomView: PKHUDWideBaseView {

    var hudType: ZJHudType = .none
    var message = ""

    init(type: ZJHudType, message: String) {
        super.init(frame: CGRect(x: 0, y: 0, w: 100, h: 50))
        
        self.hudType = type
        self.message = message
        
        self.backgroundColor = .white

    }
    
//    lazy var <#variable name#> = <#expression#>

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
