//
//  ZJEmptyView.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/11.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ZJEmptyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Float(4.0)~
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        return imageView
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel(font: UIFont.systemFont(ofSize: 16)~,
                            color: .black,
                            alignment: .center)
        label.text = "暂无数据"
        return label
    }()
}

extension ZJEmptyView {
    func createUI() {
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.descLabel)
        
        self.imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20~)
        }
        
        self.descLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(15~)
            make.bottom.equalToSuperview().offset(-20~)
        }
        
        self.contentView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(kScreenWidth - 24~)
        }
    }
    
    func update(imageName: String, title: String) {
        self.imageView.image = UIImage(named: imageName)
        self.descLabel.text = title
    }
}
