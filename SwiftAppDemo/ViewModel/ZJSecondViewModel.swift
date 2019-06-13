//
//  ZJSecondViewModel.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/11.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondViewModel: ZJBaseViewModel, ViewModelType {
    struct Input {
        let headerRefresh: Observable<Void>
        let footerRefresh: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        input.headerRefresh.flatMapLatest({ [weak self] () -> Observable<[Any]> in
            guard let self = self else { return Observable.just([]) }
            return self.request()
                .trackActivity(self.headerLoading)
        })
            .subscribe(onNext: { (items) in
                
            }).disposed(by: rx.disposeBag)
        
        input.footerRefresh.flatMapLatest({ [weak self] () -> Observable<[Any]> in
            guard let self = self else { return Observable.just([]) }
            return self.request()
                .trackActivity(self.footerLoading)
        })
            .subscribe(onNext: { (items) in
                
            }).disposed(by: rx.disposeBag)
        
        
        return Output()
    }
    
    func request() -> Observable<[Any]> {
        
        return ZJNetWorkManager.provider.rx.request(.testApi).trackActivity(loading).map { (data) -> [Any] in
            
            return [Any]()
            
        }.asObservable()
    }
}
