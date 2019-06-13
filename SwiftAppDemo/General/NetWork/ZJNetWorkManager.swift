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
    
    static let provider = MoyaProvider<ZJSwiftApi>()
    
    static func testDemoApi() -> Observable<ZJBaseModel> {
        
        return
            provider
                .rx
                .request(.testApi)
                .map(dataModel: ZJStatusModel.self)
                .asObservable()
    }
    
}
