//
//  RSTwoSixReusableView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import UIKit

class RSTwoSixReusableView: UICollectionReusableView {
        
    
    lazy var label:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.purple
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    var title:String?{
        didSet{
            guard let _title = title else { return }
            label.text = _title
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.orange
        
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
    }
    
    
}
