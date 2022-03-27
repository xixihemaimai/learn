//
//  RSTwoCustomView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/27.
//

import UIKit




protocol TwoDeleate{
    static var twos:Int{get}
    var twod:Int{get}
    var twoss:Int{get set}
}



enum two:Int,TwoDeleate{
    
    var twod: Int{
        set{
            newValue + 10
        }
        get{
            return 1000
        }
    }
    
    static var twos: Int {
        get{
            return 100
        }
        
        set{
           newValue + 10
        }
    }
    
    var twoss: Int {
        get{
            return 10
        }
        set{
          newValue + 100
        }
    }
    
    case wo
    case me
    //枚举里面必须为计算属性而且还需要和相关的东西有关
//    var dd3:Int = 3
    var dd3:Int{
        switch self{
        case .wo:
            return  1
        case .me:
            return 2
        }
    }

    
}



class RSTwoCustomView: RSCustomView {
    
    override var dd2:Int{
        return 19
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
//        self.add 只要加了fileprivate就只能在当前的类上面使用，不管是扩展还是继承
//        ddd
        
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    

}


