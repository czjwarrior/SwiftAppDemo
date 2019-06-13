//
//  ZJPageModel.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import HandyJSON

struct ZJPageModel :HandyJSON{
    
    var totalPage: String?
    var pageSize: String?
    var nextPage: String?
    var totalCou: String?
}
