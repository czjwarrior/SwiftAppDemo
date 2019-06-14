//
//  ZJSecondViewModel.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/11.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ZJSecondViewModel: ZJBaseViewModel, ViewModelType {
    struct Input {
        let headerRefresh: Observable<Void>
        let footerRefresh: Observable<Void>
    }
    
    struct Output {
        let items: Variable<[ZJRemainOilModel]>
    }
    
    func transform(input: Input) -> Output {
        
        let repository = Variable<[ZJRemainOilModel]>([ZJRemainOilModel]())
        
        input.headerRefresh.flatMapLatest({ [weak self] () -> Observable<[Any]> in
            guard let self = self else { return Observable.just([]) }
            return self
                .request()
                .trackActivity(self.headerLoading)
        }).subscribe(onNext: { (items) in
            
            repository.value = items as! [ZJRemainOilModel]
            
        }).disposed(by: rx.disposeBag)
        
        input.footerRefresh.flatMapLatest({ [weak self] () -> Observable<[Any]> in
            guard let self = self else { return Observable.just([]) }
            return self
                .request()
                .trackActivity(self.footerLoading)
        })
            .subscribe(onNext: { (items) in
                
                repository.value += items as! [ZJRemainOilModel]
                
            }).disposed(by: rx.disposeBag)
        
        
        return Output(items: repository)
    }
    
    func request() -> Observable<[Any]> {
        
        return
            ZJNetWorkManager
                .testDemoApi()
                .trackActivity(loading)
                .map({ (baseModel) -> [ZJRemainOilModel] in
                    let dataModel = baseModel.data as! [ZJRemainOilModel]
                    return dataModel
                    
            }).asObservable()
    }
}
