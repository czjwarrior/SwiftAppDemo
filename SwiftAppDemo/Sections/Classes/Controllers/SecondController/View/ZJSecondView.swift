//
//  ZJSecondView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondView: ZJBaseTableView {
    
    let dataArray = [["哈哈哈"], ["啦啦啦啦", "啪啪啪"]]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func registerCell(tableView: UITableView) {
        tableView.registerCell(ZJSecondCell.self)
    }
}

extension ZJSecondView: ZJBaseTableDataSourceProrocol {
    
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
//        ZJ_TopVc().pushVC(ZJThirdController())
//        self.makeToast("哈哈！！！")
        
        ZJHudView.zjShowHud(hudType: .loading, message: "哈哈")
    }
}
