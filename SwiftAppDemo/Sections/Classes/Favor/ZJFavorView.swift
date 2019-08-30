//
//  ZJFavorView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/8/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJFavorView: ZJBaseTableView {

    override func registerCell(tableView: UITableView) {
        tableView.registerCell(ZJFavorCell.self)
    }
}

extension ZJFavorView: ZJBaseTableDataSourceProrocol {
    func numberOfRowsInSection(section: Int) -> Int {
        return 10
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReusableCell(indexPath: indexPath) as ZJFavorCell
        return cell
    }
}
