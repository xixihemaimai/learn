//
//  RSTwoFiveViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/30.
//

import UIKit

class RSTwoFiveViewController: UITabBarController {

    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor.yellow], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor.orange], for: .selected)
        
//        addChildViewController()
        
        let tabbar1 = RSCustomTabBar()
        tabbar1.slecect = { index in
            print(index)
        }
//        self.setValue(tabBar, forKey: "tabBar")
        self.setValue(tabbar1, forKey: "tabBar")
        
    }
    
    
    //添加俩个子控制器
    func addChildViewController(){
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.green
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.navigationBar.isTranslucent = false
        nav1.tabBarItem = UITabBarItem(title: "1", image: UIImage(named: ""), selectedImage:UIImage(named: ""))
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.navigationBar.isTranslucent = false
        nav2.tabBarItem = UITabBarItem(title: "2", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        tabBar.isTranslucent = false
        
        self.addChild(nav1)
        self.addChild(nav2)
    }
    
}
