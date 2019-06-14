//
//  MJRefresh+Rx.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import MJRefresh

extension Reactive where Base: MJRefreshHeader {
    
    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { refreshControl, active in
            if active {
//                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }
    }
}

extension Reactive where Base: MJRefreshFooter {
    
    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { refreshControl, active in
            if active {
//                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }
    }
}
