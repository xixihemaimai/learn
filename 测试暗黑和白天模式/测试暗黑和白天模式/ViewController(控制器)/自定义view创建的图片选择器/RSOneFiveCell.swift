//
//  RSOneFiveCell.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneFiveCell: UICollectionViewCell {
    
    var imageView:UIImageView?
    var editimageView:UIImageView?
    
    //俩个闭包
    var clickEditCellBlock:(()->())?
    var clickImageViewCellBlock:(()->())?
    
    
//    var name:String?{
//        didSet{
//            guard let name = name else{
//                return
//            }
//            btn?.setTitle(name, for: .normal)
//        }
//    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        imageView = UIImageView()
        imageView?.backgroundColor = UIColor.yellow
        imageView?.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tagDidImageViewCLick))
        imageView?.addGestureRecognizer(tap)
        editimageView = UIImageView()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tagDidCLick))
        editimageView?.isUserInteractionEnabled = true
        editimageView?.addGestureRecognizer(tap1)
        contentView.addSubview(imageView!)
        contentView.addSubview(editimageView!)
        imageView!.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).offset(8)
            make.right.bottom.equalTo(contentView).offset(-8)
        }
        
        editimageView?.snp.makeConstraints({ make in
            make.right.top.equalTo(contentView)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tagDidImageViewCLick(tap:UITapGestureRecognizer){
        clickImageViewCellBlock!()
    }
    
    @objc func tagDidCLick(tap:UITapGestureRecognizer){
        clickEditCellBlock!()
    }
}
