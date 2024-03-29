//
//  ZJBaseTableViewCell.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJBaseTableViewCell: UITableViewCell, ZJReusableCell {

    var cellPosition: ZJCellPosition = .top
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isCellPositionAtTop() -> Bool {
        if self.cellPosition == .top ||
            self.cellPosition == .onlyOne {
            return true
        }
        return false
    }
    
    func isCellPositionAtBottom() -> Bool {
        if self.cellPosition == .bottom ||
            self.cellPosition == .onlyOne {
            return true
        }
        return false
    }
}
