//
//  ZJSecondController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondController: ZJBaseTableViewController {
    
    var viewModel: ZJSecondViewModel = ZJSecondViewModel()
    var dataArray = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.baseView.showPopBtn()
        self.title = "二级页面"
        
        self.bindViewModel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dataArray = [["哈哈哈"], ["啦啦啦啦", "啪啪啪"]]
            
            self.reloadData()
        }
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
        
        
        
        isLoading.subscribe(onNext: { [weak self] (loading) in
            
            var hud: ZJHudView?
            
            if loading {
                
                
                hud = ZJHudView.zjShowHud(hudType: .loading)
            } else {
                
                hud?.hide(true)
            }
            
//            loading ? ZJHudView.zjShowHud(hudType: .loading) : ZJHudView()
            
//            loading ? self?.startAnimating(): self?.stopAnimating()
        }).disposed(by: rx.disposeBag)
        
    }
}

extension ZJSecondController: ZJBaseTableDataSourceProrocol {
    
    func numberOfRowsInSection(section: Int) -> Int {
        return self.dataArray[section].count
    }
    
    func numberOfSections() -> Int {
        return self.dataArray.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReusableCell(indexPath: indexPath) as ZJSecondCell
        
        cell.updateByData(data: self.dataArray[indexPath.section][indexPath.row])
        cell.cellPosition = tableView.getCellPosition(dataArray: dataArray,
                                                      indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        ZJHudView.zjShowHud(hudType: .success, message: "哈哈lalal")
        self.pushVC(ZJThirdController())
    }
}

