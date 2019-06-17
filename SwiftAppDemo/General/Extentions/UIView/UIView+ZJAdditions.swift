//
//  UIView+ZJAdditions.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/16.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

typealias ActionBlock = () -> Void
private var kDTActionHandlerTapBlockKey =           "DTActionHandlerTapBlockKey"
private var kDTActionHandlerTapGestureKey =         "DTActionHandlerTapGestureKey"

extension UIView {
    
    var view_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(width) {
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    var view_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(height) {
            self.frame.size = CGSize(width: view_width, height: height)
        }
    }
    var view_left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(left) {
            self.frame = CGRect(x: left, y: self.frame.origin.y, width: view_width, height: view_height)
        }
    }
    var view_right: CGFloat {
        get {
            return self.frame.origin.x + self.view_width
        }
        set(right) {
            self.frame = CGRect(x: right - view_width, y: self.frame.origin.y, width: view_width, height: view_height)
        }
    }
    var view_top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(top) {
            self.frame = CGRect(x: left, y: top, width: view_width, height: view_height)
        }
    }
    var view_bottom: CGFloat {
        get {
            return self.frame.origin.y + view_height
        }
        set (bottom) {
            self.frame = CGRect(x: left, y: bottom - view_height, width: view_width, height: view_height)
        }
    }
    
    // 设置圆角方向
    func setPartRoundCorner(corners: UIRectCorner, cornerRadius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func setTapActionWithBlock(block:@escaping ActionBlock) {
        self.isUserInteractionEnabled = true
        var gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey)
        if gesture == nil {
            gesture = UITapGestureRecognizer.init(target: self, action: #selector(handleActionForTapGesture(_:)))
            self.addGestureRecognizer(gesture as! UIGestureRecognizer)
            objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    @objc func handleActionForTapGesture(_ gesture: UITapGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.recognized {
            let action = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey) as? ActionBlock
            if action != nil {
                action!()
            }
        }
    }
    
    static func loadNib(_ nibNmae: String? = nil) -> UIView {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! UIView
    }
}
