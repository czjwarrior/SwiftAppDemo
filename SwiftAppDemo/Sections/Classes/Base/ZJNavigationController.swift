//
//  ZJNavigationController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJNavigationController: UINavigationController {

    var popDelegate: UIGestureRecognizerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

extension ZJNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
}
