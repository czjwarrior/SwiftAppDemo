//
//  UITableView+ZJAdditions.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

protocol ZJReusableCell: class {
    static var reuseableIdentifier: String { get }
    static var nib: UINib? { get }
}

extension ZJReusableCell where Self: UITableViewCell {
    static var reuseableIdentifier: String { return String(describing: self) }
    
    static var nib: UINib? { return nil }
}

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
}

