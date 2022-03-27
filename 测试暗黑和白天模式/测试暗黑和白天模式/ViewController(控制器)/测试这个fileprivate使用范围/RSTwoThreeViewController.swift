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
        
    }

}

//extension RSTwoTwoViewController:RSCustomViewDelegate{
//    func toRun() {
//        LXFLog("测试下")
//    }
//}
