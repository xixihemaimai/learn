//
//  RSTwoEightTool.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/1.
//

import UIKit

class RSTwoEightTool: NSObject {

    static let instance = RSTwoEightTool()
    
    class func share()->RSTwoEightTool{
        return instance
    }
    
    
    override init(){
        super.init()
        
        let number = newAdd { plus in
            return plus
        }
        print(number)
    }
    
    
    func newAdd(_ add:((_ plus:Int) -> Int)){
        add(10)
    }

}

extension RSTwoEightTool{
    
//    var add:Int{
//        return 100
//    }
    
    
    func add1(_ num:Int,_ num1:Int)->Int{
        return num + num1
    }
    
}



