//
//  ZJSecondView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondView: ZJBaseTableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.updateByDataArray(dataArray: ["哈哈哈", "啦啦啦啦", "啪啪啪"])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func registerCell(tableView: UITableView) {
        tableView.registerCell(ZJSecondCell.self)
    }
    
    override func tableView(_ tableView: UITableView, dequeReusableCellAtIndexPath: IndexPath) -> ZJBaseTableViewCell {
        return tableView.dequeReusableCell(indexPath: dequeReusableCellAtIndexPath) as ZJSecondCell
    }
}
