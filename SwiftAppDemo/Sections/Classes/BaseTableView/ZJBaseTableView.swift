//
//  ZJBaseTableView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJBaseTableView: UIView {
    
    weak var tableViewDelegate: ZJBaseTableDataSourceProrocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableViewDelegate = self as? ZJBaseTableDataSourceProrocol
        
        self.addSubview(self.mTableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        self.registerCell(tableView: tableView)
        
        return tableView
    }()
    
    // 子类重写
    func registerCell(tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func reloadData() {
        self.mTableView.reloadData()
    }
    
//    func getDataAtIndexPath(indexPath: IndexPath) -> T? {
//        guard let dataArray = dataArray, indexPath.row < dataArray.count else {
//            return nil
//        }
//        return dataArray[indexPath.row]
//    }
//
//    func getPositionByIndexPath(indexPath: IndexPath) -> ZJCellPosition {
//        guard let dataArray = dataArray else {
//            return .middle
//        }
//        if dataArray.count == 1 {
//            return .onlyOne
//        }
//        if indexPath.row == 0 {
//            return.top
//        }
//        if indexPath.row == dataArray.count - 1 {
//            return .bottom
//        }
//        return .middle
//    }
//
//    func updateByDataArray(dataArray: [T]?) {
//        self.dataArray = dataArray
//        self.mTableView.reloadData()
//    }
}

extension ZJBaseTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewDelegate?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (self.tableViewDelegate?.cellForRowAt(tableView: tableView, indexPath: indexPath))!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewDelegate?.numberOfSections() ?? 1
    }
}
