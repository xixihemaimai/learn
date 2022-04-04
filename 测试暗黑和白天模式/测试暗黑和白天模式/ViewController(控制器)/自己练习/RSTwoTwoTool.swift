//
//  RSTwoTwoTool.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/2.
//

import UIKit

class RSTwoTwoTool: RSTwoEightTool {

    var a:Int
    var b:Int
    
    init(a:Int,b:Int){
        self.a = a
        self.b = b
        super.init()
    }
    
    
    override func newAdd(_ add: ((Int) -> Int)) {
        print("---------------")
    }
}

extension RSTwoTwoTool{
    var c:Int{
        set{
           a += newValue
        }
        get{
            return 10
        }
    }
    
    convenience init(a:Int = 10){
        self.init(a: a, b: 10)
        print(c)
    }
}
