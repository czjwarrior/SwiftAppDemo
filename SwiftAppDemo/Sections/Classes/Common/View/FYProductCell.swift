//
//  FYProductCell.swift
//  SwiftAppDemo
//
//  Created by cenzhijun on 2019/07/24. All rights reserved.
//

import UIKit
import UtilCore

class  FYProductCell: UITableViewCell {
    
    @IBOutlet weak var text_lb: UILabel!
    
    var item:FYSwiftAppDemoModel? {
        didSet {
            
        }
    }

    override func awakeFromNib() {
        
    }
}
