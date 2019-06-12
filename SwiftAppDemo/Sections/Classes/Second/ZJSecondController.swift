//
//  ZJSecondController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondController: ZJBaseTableViewController {
    
    let dataArray = [["哈哈哈"], ["啦啦啦啦", "啪啪啪"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.baseView.showPopBtn()
        self.title = "二级页面"
    }
    
    override func registerCell(tableView: UITableView) {
        tableView.registerCell(ZJSecondCell.self)
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

