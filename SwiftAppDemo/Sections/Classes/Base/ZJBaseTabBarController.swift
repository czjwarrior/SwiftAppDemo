//
//  ZJBaseTabBarController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class ZJBaseTabBarController: ESTabBarController {

    var preIndex: Int = 0
    var navControllers: [ZJNavigationController] = [ZJNavigationController]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupControllers()
        self.delegate = self
        
//        self.selectedIndex = 0
        
        self.configAppearance()
    }
    
    func configAppearance() {
        // 加阴影
//        self.tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
//        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.tabBar.layer.shadowOpacity = 1;
//        self.tabBar.layer.shadowRadius = 4;
        self.tabBar.backgroundColor = UIColor.white
        
        //tabbar隐藏默认的黑线
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    func setupControllers() {
        
        for index in 0..<self.tabBarCount() {
            
            let rootController = self.createViewController(index: index)
            
            let title = self.tabBarTitles()[index]
            let imageStr = self.tabBarImages()[index]
            let selestedImageStr = imageStr + "_1"
            
            rootController.tabBarItem = ESTabBarItem.init(self.customTabBarItem(),
                                                          title: title,
                                                          image: UIImage(named: imageStr),
                                                          selectedImage: UIImage(named: selestedImageStr))
            
            let navController = ZJNavigationController(rootViewController: rootController)
//            navController.delegate = self
            self.navControllers.append(navController)
        }
        
        self.setViewControllers(self.navControllers, animated: true)
    }
    
    // MARK: - Overwrite
    
    func tabBarCount() -> Int {
        return 0
    }
    
    func tabBarImages() -> [String] {
        return [""]
    }
    
    func tabBarTitles() -> [String] {
        return [""]
    }
    
    func createViewController(index: Int) -> ZJBaseViewController {
        return ZJBaseViewController()
    }
    
    func customTabBarItem() -> ESTabBarItemContentView {
        return ESTabBarItemContentView()
    }
}

//extension ZJBaseTabBarController: UINavigationControllerDelegate {
//
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        if navigationController.viewControllers.count >= 2 {
//            self.tabBar.isHidden = true
//        }
//    }
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        if navigationController.viewControllers.count == 1 {
//            self.tabBar.isHidden = false
//        } else {
//            self.tabBar.isHidden = true
//        }
//    }
//}

extension ZJBaseTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.preIndex = self.selectedIndex
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = self.navControllers.firstIndex(of: viewController as! ZJNavigationController)
        if self.preIndex == index {
            // 重复点击同一个Tab
            let nav = viewController as! ZJNavigationController
            let rootVc = nav.viewControllers.first as! ZJBaseViewController
            
            rootVc.handleTabBarRootMutiClicked()
        }
        return true
    }
}

