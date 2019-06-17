//
//  ZJSecondController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ZJSecondController: ZJBaseTableViewController, NVActivityIndicatorViewable {
    
    var viewModel: ZJSecondViewModel = ZJSecondViewModel()
    var dataArray = [ZJRemainOilModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.baseView.showPopBtn()
        self.title = "二级页面"
        
        self.bindViewModel()
    }
    
    override func registerCell(tableView: UITableView) {
        tableView.registerCell(ZJSecondCell.self)
    }
    
    func bindViewModel() {
     
        let refresh = Observable.of(Observable.just(()), headerRefreshTrigger).merge()
        let input = ZJSecondViewModel.Input(headerRefresh: refresh, footerRefresh: footerRefreshTrigger)
        let output = viewModel.transform(input: input)
        
        viewModel.loading.asObservable().bind(to: isLoading).disposed(by: rx.disposeBag)
        viewModel.headerLoading.asObservable().bind(to: isHeaderLoading).disposed(by: rx.disposeBag)
        viewModel.footerLoading.asObservable().bind(to: isFooterLoading).disposed(by: rx.disposeBag)
        viewModel.hasNextPage.asDriver().asObservable().subscribe(onNext: { (hasNextPage) in
            if !hasNextPage {
                self.mTableView.mj_footer.endRefreshing()
                self.mTableView.mj_footer.endRefreshingWithNoMoreData()
            } else {
                /** 重置没有更多的数据（消除没有更多数据的状态） */
                self.mTableView.mj_footer.resetNoMoreData()
            }
            
        }).disposed(by: rx.disposeBag)
        
        let hud = ZJHudView.zjShowHud(hudType: .loading)
        isLoading.subscribe(onNext: { (loading) in
            if !loading {hud.hide(true)}
        }).disposed(by: rx.disposeBag)
        
        output.items.asObservable().subscribe(onNext: { [weak self] (item) in
            
            self?.dataArray = item
            self?.mTableView.reloadData()
            
        }).disposed(by: rx.disposeBag)
    }
}

extension ZJSecondController: ZJBaseTableDataSourceProrocol {
    
    func numberOfRowsInSection(section: Int) -> Int {
        return self.dataArray.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReusableCell(indexPath: indexPath) as ZJSecondCell
        
        cell.updateByData(data: self.dataArray[indexPath.row])
        cell.cellPosition = tableView.getCellPosition(dataArray: dataArray,
                                                      indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        ZJHudView.zjShowHud(hudType: .success, message: "哈哈lalal")
        self.pushVC(ZJThirdController())
    }
}

