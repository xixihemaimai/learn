//
//  RSModel.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/20.
//

import UIKit

class RSModel: NSObject,NSCoding{
   
    var name:String?
    var phoneNum:String?
    var password:String?
     
    
    init(name:String,phoneNum:String,password:String){
        super.init()
        self.name = name
        self.phoneNum = phoneNum
        self.password = password
    }
    
    
    required init?(coder: NSCoder) {
        name = coder.value(forKey: "name") as? String
        phoneNum = coder.value(forKey: "phoneNum") as? String
        password = coder.value(forKey: "password") as? String
    }
    
    
    func encode(with coder: NSCoder) {
        coder.setValue(name, forKey: "name")
        coder.setValue(phoneNum, forKey: "phoneNum")
        coder.setValue(password, forKey: "password")
    }
    
}
