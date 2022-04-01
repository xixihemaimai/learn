//
//  RSTwoFourCell.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/28.
//

import UIKit

class RSTwoFourCell: UICollectionViewCell {
    
    //图片
    lazy var cellImage:UIImageView = {
        let cellImage = UIImageView()
        return cellImage
    }()
    //文字
    lazy var label:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.green
        //添加图片
        contentView.addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(contentView).offset(30)
        }
        
        //添加文字
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
//            make.right.left.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(cellImage.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
