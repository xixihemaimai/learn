//
//  RSCustomTabBar.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/30.
//

import UIKit
import SnapKit
import SwiftUI

class RSCustomTabBar: UITabBar {

    
    var slecect:((_ index:Int)->())?
    
    
    lazy var plusBtn:UIButton = {
       let plusBtn = UIButton()
        plusBtn.setTitle("测试", for: .normal)
        plusBtn.setTitle("测试", for: .normal)
        plusBtn.setTitleColor(UIColor.red, for: .normal)
        plusBtn.setTitleColor(UIColor.green, for: .selected)
        plusBtn.setImage(UIImage(named: ""), for: .normal)
        plusBtn.setImage(UIImage(named: ""), for: .selected)
        return plusBtn
    }()
    
    //这边要设置4个不同的按键 --- 然后进行分配位置在进行点击的问题
    override init(frame: CGRect){
        super.init(frame: frame)
       addCutomItem()
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addCutomItem(){
        //这边增加一个按键
        self.addSubview(plusBtn)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //这边设置按键的位置，和重新设置底下四个按键的位置
        let w = Int(SCW)/self.items!.count + 1
//        let y = 0
        let h = self.bounds.size.height
//        let x = 0
        for (var idx,item) in self.subviews.enumerated(){
            if idx == 2{
                idx = 3
            }
            if item.isKind(of: UITabBarItem.self){
                item.snp.makeConstraints { make in
                    make.left.equalTo(idx * w)
                    make.top.equalToSuperview()
                    make.bottom.equalToSuperview()
                    make.width.equalTo(w)
                }
            }
        }
        //这边在添加下第三个按键的位置
        plusBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-(0.5 * h))
            make.width.equalTo(w)
            make.height.equalTo(h)
            make.left.equalTo(2 * w)
        }
        
        
//        for item in self.subviews {
//            //这边设置按键的位置---宽度和x的位置
//            //高度和y是一样的
//            //这边判断下第二个的时候+1
//
//
//
//            if item.isKind(of: UITabBarItem.self){
//
//
//            }
//        }
    }
    
    
    
    

}


extension RSCustomTabBar:UITabBarDelegate{
    
    //点击
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        slecect!(item.tag)
    }
    
}
