//
//  RSTestToolManager.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/21.
//

import Foundation
import Alamofire


class RSTestToolManager: NSObject{
    
    static let instran = RSTestToolManager()
    
    class func share() -> RSTestToolManager{
        return instran
    }
    
    override init(){
        super.init()
    }
    
    
    
    //登陆按键
    func login()->Bool{
        
    }

    
    //自动登陆
    func autoLogin()->Bool{
       
    }
}



