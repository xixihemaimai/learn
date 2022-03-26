//
//  RSMainViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/22.
//

import UIKit

class RSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        //这边设置tabbaritem的点击的颜色和默认的颜色
        
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .selected)
        
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.yellow], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: .selected)
        
    }
    
  
    func creatViewControler(){
        
        let first = RSFirstViewController()
        let navi0 = RSNaviViewController(rootViewController: first)
        let image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let firstItem = UITabBarItem(title: "第一", image: image, selectedImage: UIImage(named: ""))
        first.tabBarItem = firstItem
        self.viewControllers?.append(navi0)
        
        
        
        let second = RSSecondViewController()
        let secondItem = UITabBarItem(title: "第二", image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: ""))
        second.tabBarItem = secondItem
        let navi1 = RSNaviViewController(rootViewController: second)
        self.viewControllers?.append(navi1)
        
        
        
        
        
    }
   
}
