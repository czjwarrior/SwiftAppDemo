//
//  UITableView+ZJAdditions.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

enum ZJCellPosition {
    case none
    case top
    case middle
    case bottom
    case onlyOne
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: ZJReusableCell
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

protocol ZJReusableCell: class {
    static var reuseableIdentifier: String { get }
    static var nib: UINib? { get }
}

extension ZJReusableCell where Self: UITableViewCell {
    static var reuseableIdentifier: String { return String(describing: self) }
    
    static var nib: UINib? { return nil }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: UITableView
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cell: T.Type) where T: ZJReusableCell {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.reuseableIdentifier)
        } else {
            register(cell, forCellReuseIdentifier: T.reuseableIdentifier)
        }
    }
    
    func dequeReusableCell<T: ZJReusableCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseableIdentifier, for: indexPath) as! T
    }
    
    func getCellPosition(dataArray:[Any], indexPath: IndexPath) -> ZJCellPosition {
        
        var targetArray = [Any]()
        var isMultiSection = false
        
        if dataArray.first is Array<Any> {
            isMultiSection = true
        }
        
        if !isMultiSection {
            targetArray = dataArray
        } else {
            targetArray = dataArray[indexPath.section] as! [Any]
        }
        
        if targetArray.count == 0 {return .none}
        
        if targetArray.count == 1 {return .onlyOne}
        
        if indexPath.row == 0 {return.top}
        
        if indexPath.row == dataArray.count - 1 {return .bottom}
        
        return .middle
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: ZJBaseTableDataSourceProrocol
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

protocol ZJBaseTableDataSourceProrocol: class {
    func numberOfRowsInSection(section: Int) -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func numberOfSections() -> Int
}

extension ZJBaseTableDataSourceProrocol {
    func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        return cell ?? UITableViewCell.init(style: .default, reuseIdentifier: "ZJBaseTableViewCell")
    }
    
    func numberOfSections() -> Int {
        return 1
    }
}
