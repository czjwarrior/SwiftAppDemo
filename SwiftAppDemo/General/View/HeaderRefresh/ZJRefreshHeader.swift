//
//  ZJRefreshHeader.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import MJRefresh

class ZJRefreshHeader: MJRefreshHeader {

    private let imageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "pullRefresh")
        return imageView
    }()
    
    override func prepare() {
        super.prepare()
        
        self.addSubview(self.imageView)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        self.imageView.bounds = CGRect.init(x: 0, y: 0, w: 25, h: 26)
        self.imageView.center = CGPoint.init(x: self.mj_w / 2.0, y: self.mj_h / 2.0 + 10.0)
    }
    
    override var state: MJRefreshState {
        
        didSet {
            guard state != oldValue else {
                return
            }
            switch state {
            case .idle:
                break
            case .willRefresh:
                break
            case .pulling:
                break
            case .refreshing:
                self.imageView.layer.add(self.creatTransformAnimation(), forKey: nil)
            case .noMoreData:
                break
            default:
                break
            }
        }
    }
    
    override var pullingPercent: CGFloat {
        
        didSet {
            self.imageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi) * pullingPercent)
        }
    }
    
    override func endRefreshing() {
        super.endRefreshing()
        self.imageView.layer.removeAllAnimations()
    }
    
    func creatTransformAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation.init(keyPath: "transform.rotation")
        animation.duration = 1.0 //设定动画持续时间
        animation.byValue = Double.pi * 2 //设定旋转角度，单位是弧度
        animation.fillMode = CAMediaTimingFillMode.forwards//设定动画结束后，不恢复初始状态之设置一
        animation.repeatCount = 1000//设定动画执行次数
        animation.isRemovedOnCompletion = false //设定动画结束后，不恢复初始状态之设置二
        return animation
    }
}
