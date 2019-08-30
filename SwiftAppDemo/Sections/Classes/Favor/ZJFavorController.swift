//
//  ZJFavorController.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/5/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJFavorController: ZJBaseLayoutController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "最爱"
        
        addToContentView(favorView)
    }
    
    lazy var favorView: ZJFavorView = {
        let view = ZJFavorView(frame: self.sContentView.bounds)
        return view
    }()
    
    
//    override func registerCell(tableView: UITableView) {
//        tableView.registerCell(ZJSecondCell.self)
//    }

}

//extension ZJFavorController: ZJBaseTableDataSourceProrocol {
//
//    func numberOfRowsInSection(section: Int) -> Int {
//        return 6
//    }
//
//    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeReusableCell(indexPath: indexPath) as ZJSecondCell
//        return cell
//    }
//}
