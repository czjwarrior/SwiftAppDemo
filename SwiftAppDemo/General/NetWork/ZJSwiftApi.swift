//
//  ZJSwiftApi.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/12.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum ZJSwiftApi {
    case testApi
}

extension ZJSwiftApi: TargetType {
    var baseURL: URL {
        
        return URL(string: "http://mock.fuyoukache.com/mock/5b7398249692d574dac50126/driver")!
    }
    
    var path: String {
        switch self {
        case .testApi:
            return "/api/app/oil/getOilSurplusList"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    
    var task: Task {
        switch self {
        case .testApi:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
