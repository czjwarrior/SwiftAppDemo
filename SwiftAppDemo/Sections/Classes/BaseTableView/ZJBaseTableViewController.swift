//
//  ZJBaseTableViewController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/11.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJBaseTableViewController: ZJBaseLayoutController {
    
    weak var tableViewDelegate: ZJBaseTableDataSourceProrocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableViewDelegate = self as? ZJBaseTableDataSourceProrocol
        
        self.addToContentView(self.mTableView)
        
        
    }
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: self.sContentView.bounds, style: .plain)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
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

}

extension ZJBaseTableViewController: UITableViewDataSource, UITableViewDelegate {
    
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
