//
//  RSCustomView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/27.
//

import UIKit

@objc protocol RSCustomViewDelegate:NSObjectProtocol{
    @objc optional func toRun()
}

class RSCustomView: UIView {

    //只能是类才能设置为代理
    weak var delegate:RSCustomViewDelegate?
    
    //只能在当前类里面使用
    fileprivate var add:Int = 0
    
    //这俩中情况是不能重新的
    let ddd:Int = 0
    static var dd1:Int = 2
   
    
    //只读也是可以重写的
    var dd2:Int{
        return 10
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


extension RSCustomView{
    //扩展这边添加了fileprivate也是只能在当前类里面使用
    fileprivate var plus:Int{
        return 11
    }
}
