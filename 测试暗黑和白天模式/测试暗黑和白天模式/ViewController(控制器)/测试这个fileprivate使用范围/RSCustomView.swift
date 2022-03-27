//
//  RSCustomView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/27.
//

import UIKit

protocol RSCustomViewDelegate{
    func toRun()
}

class RSCustomView: UIView {

    //weak var delegate:RSCustomViewDelegate?
    fileprivate var add:Int = 0
    let ddd:Int = 0
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


extension RSCustomView{
    fileprivate var plus:Int{
        return 11
    }
    
    
}
