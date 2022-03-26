//
//  RSSixViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/20.
//

import UIKit

class RSSixViewController: RSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.yellow
        view.addSubview(view1)
        
        
        view1.layer.shadowColor = UIColor.blue.cgColor
        view1.layer.shadowRadius = 7
        view1.layer.shadowOffset = CGSize(width: 0, height: 0)
        view1.layer.shadowOpacity = 0.7
        
        
        
        let bezt = UIBezierPath(roundedRect: view1.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 7, height: 7))
        let layer = CAShapeLayer()
        layer.path = bezt.cgPath
        layer.frame = view1.bounds
        view1.layer.addSublayer(layer)
        
        let model = RSModel(name: "1", phoneNum: "2", password: "3")
        let data = NSKeyedArchiver.archivedData(withRootObject: model)
        
         let path = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first?.appendingPathComponent("111")
        do{
            _ = try data.write(to: path!)
        }catch{
            
        }
        
        //这边是存入指定位置
        
        
        
    }
}
