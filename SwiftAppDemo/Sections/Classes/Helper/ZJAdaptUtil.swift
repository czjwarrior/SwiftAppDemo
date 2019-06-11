//
//  ZJAdaptUtil.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/10.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJAdaptUtil: NSObject {
    static let shared = ZJAdaptUtil()
    private override init() { }
    
    /// 默认参照宽度 - 以iPhone6效果图为适配基准
    @objc public private(set) var referenceW: CGFloat = 375
    
    fileprivate func fitNumberSize(_ value: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width / referenceW * value
    }
    
    fileprivate func fitFontSize(_ font : UIFont) -> UIFont {
        return font~
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: operator ~
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

postfix operator ~

public postfix func ~ (value: CGFloat) -> CGFloat {
    return ZJAdaptUtil.shared.fitNumberSize(value)
}

public postfix func ~ (font: UIFont) -> UIFont {
    return UIFont(name: font.fontName, size: font.pointSize~) ?? font
}

public postfix func ~ (value: Int) -> CGFloat {
    return CGFloat(value)~
}

public postfix func ~ (value: Float) -> CGFloat {
    return CGFloat(value)~
}

public postfix func ~ (value: CGPoint) -> CGPoint {
    return CGPoint(
        x: value.x~,
        y: value.y~
    )
}

public postfix func ~ (value: CGSize) -> CGSize {
    return CGSize(
        width: value.width~,
        height: value.height~
    )
}

public postfix func ~ (value: CGRect) -> CGRect {
    return CGRect(
        x: value.origin.x~,
        y: value.origin.y~,
        width: value.size.width~,
        height: value.size.height~
    )
}

public postfix func ~ (value: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(
        top: value.top~,
        left: value.left~,
        bottom: value.bottom~,
        right: value.right~
    )
}
