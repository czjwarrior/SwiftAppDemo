//
//  ZJNetWorkManager.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/12.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import HandyJSON
import RxSwift
import EZSwiftExtensions

class ZJNetWorkManager: NSObject {
    
    let provider = MoyaProvider<ZJSwiftApi>()
    
    func testDemoApi() -> Observable<ZJBaseModel> {
        
        return provider.rx.request(.testApi).map(dataModel: ZJBaseModel.self)
        
    }
    
}
