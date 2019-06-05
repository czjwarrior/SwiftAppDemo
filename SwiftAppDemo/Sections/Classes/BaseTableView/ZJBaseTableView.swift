//
//  ZJBaseTableView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJBaseTableView: UIView {
    
    var dataArray: [Any]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
}

extension ZJBaseTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView(tableView, dequeReusableCellAtIndexPath: indexPath)
        
        let data = self.getDataAtIndexPath(indexPath: indexPath)
        let position = self.getPositionByIndexPath(indexPath: indexPath)
        cell.updateByData(data: data, position: position)
        return cell
    }
    
    @objc func tableView(_ tableView: UITableView, dequeReusableCellAtIndexPath: IndexPath) -> ZJBaseTableViewCell {
        return tableView.dequeReusableCell(indexPath: dequeReusableCellAtIndexPath) as ZJBaseTableViewCell
    }
    
    @objc func registerCell(tableView: UITableView) {
        
    }
    
    @objc func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func getDataAtIndexPath(indexPath: IndexPath) -> Any? {
        guard let dataArray = dataArray, indexPath.row < dataArray.count else {
            return nil
        }
        return dataArray[indexPath.row]
    }
    
    func getPositionByIndexPath(indexPath: IndexPath) -> ZJCellPosition {
        guard let dataArray = dataArray else {
            return .middle
        }
        if dataArray.count == 1 {
            return .onlyOne
        }
        if indexPath.row == 0 {
            return.top
        }
        if indexPath.row == dataArray.count - 1 {
            return .bottom
        }
        return .middle
    }
    
    func updateByDataArray(dataArray: [Any]?) {
        self.dataArray = dataArray
        self.mTableView.reloadData()
    }
}
