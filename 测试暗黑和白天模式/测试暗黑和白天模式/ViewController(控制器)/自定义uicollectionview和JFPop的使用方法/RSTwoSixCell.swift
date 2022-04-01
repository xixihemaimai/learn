//
//  RSTwoSixCell.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import UIKit

class RSTwoSixCell: UICollectionViewCell {
    
    
    lazy var label:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.green
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var data:String?{
        didSet{
            guard let _data = data else { return }
            label.text = _data
        }
    }
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        contentView.layer.cornerRadius = 5
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
