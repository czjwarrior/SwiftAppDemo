//
//  ZJBaseViewModel.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class ZJBaseViewModel: NSObject {
    
    var page = 1
    var pageSize = 20
    public let hasNextPage = Variable(true)

    let loading = ActivityIndicator()
    let headerLoading = ActivityIndicator()
    let footerLoading = ActivityIndicator()
    
    let error = ErrorTracker()
    let parsedError = PublishSubject<Error>()
    
    override init() {
        super.init()
        
    }
    
}
