//
//  ZJSecondCell.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/29.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJSecondCell: ZJBaseTableViewCell<String> {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.title)
        self.contentView.backgroundColor = UIColor.random()
        
        self.title.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(60)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title: UILabel = {
        let label = UILabel(font: UIFont.systemFont(ofSize: 16),
                            color: .black,
                            alignment: .left)
        return label
    }()

    override func updateByData(data: String?) {
        super.updateByData(data: data)
        
        self.title.text = data
        
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.cellPosition == .top {
            self.contentView.roundCorners([.topLeft, .topRight], radius: 12)
        }
        
        if self.cellPosition == .bottom {
            self.contentView.roundCorners([.bottomLeft, .bottomRight], radius: 12)
        }
    }
}
