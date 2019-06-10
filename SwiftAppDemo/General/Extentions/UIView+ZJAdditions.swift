//
//  UIView+ZJAdditions.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/16.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

extension UIView {
    func setPartRoundCorner(corners: UIRectCorner, cornerRadius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
