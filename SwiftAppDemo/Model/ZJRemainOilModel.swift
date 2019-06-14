//
//  ZJRemainOilModel.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import HandyJSON

enum ZJRemainOilType {
    case notUpload  // 不可上传
    case upload     // 可上传
    case modify     // 可修改
}

struct ZJRemainOilModel: HandyJSON {
    
    var recordDate: String?      // 月份时间戳  long类型
    var oilSurplus: String?      // 余油    double类型 最多三位小数
    var isUpload: String?        // //是否可以上传 0不可以  1可以 2可修改
    
    func getRemainOilType() -> ZJRemainOilType {
        switch self.isUpload {
        case "0":
            return .notUpload
        case "1":
            return .upload
        case "2":
            return .modify
        default:
            return .upload
        }
    }
}
