//
//  ViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var btn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.yellow
        btn.tag = 1
        btn.addTarget(self, action: #selector(test), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("----------------------------")
        self.view.backgroundColor = UIColor.colorWithDyColorChangObject(lightColor: "#3385ff", darkColor: "#33333", alpha: 1.0)
        print(scale(100))
        print(scale(50))
        self.btn.frame = CGRect.init(x: 100.0, y: 100.0, width: scale(100), height: scale(50))
        
        print(self.btn.x)
        view.addSubview(self.btn)
    }
    
    
    @objc func test(btn:UIButton){
        print("------------\(btn.tag)")
        print("测试下");
    }


}

