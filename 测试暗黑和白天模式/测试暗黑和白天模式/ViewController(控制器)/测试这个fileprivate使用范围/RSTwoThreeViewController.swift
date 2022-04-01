//
//  RSTwoThreeViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/27.
//

import UIKit


enum twossss:String,towwwww{
   mutating func mut() {
     switch self{
       case .me:
         self = .we
       case .we:
         self = .me
       }
    }
    case me = "1"
    case we = "2"
}

protocol towwwww{
   mutating func mut()
}


struct setting:towwwww{
    var a:Int
    var b:Int
    var c:Int
    
    mutating func mut() {
//        self.a = 10
//        self.b = 11
//        self.c = 12
        switch self.a{
        case 1:
            self.a = 10
        case 2:
            self.b = 11
        case 3:
            self.c = 11
        default:
            self.a = 13
        }
    }
}




class RSTwoThreeViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        let customView = RSTwoCustomView(frame: CGRect(x: 10, y: 100, width: 100, height: 100))
        customView.backgroundColor = UIColor.yellow
        view.addSubview(customView)
//        customView.delegate = self
        
        var to = twossss.me
        to.mut()
        LXFLog(to)
        
        
        var seet = setting.init(a: 1, b: 2, c: 3)
        seet.mut()
//        seet.a = 1000
        LXFLog(seet.a)
        
        
    }

}

//extension RSTwoTwoViewController:RSCustomViewDelegate{
//    func toRun() {
//        LXFLog("测试下")
//    }
//}
