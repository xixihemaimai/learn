//
//  RSSecondViewModel.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/16.
//

import UIKit

class RSSecondViewModel: NSObject {
        
    var imageString = "123"
    
    override init(){
      print("1---------")
        super.init()
        run()
    }
    
    func run(){
        print("跑步")
    }

}

extension RSSecondViewModel{
    convenience init(imageString:String){
        self.init()
        self.imageString = imageString
        print(self.imageString)
    }
}
