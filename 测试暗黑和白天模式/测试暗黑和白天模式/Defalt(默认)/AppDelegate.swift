//
//  AppDelegate.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var allRoation:Bool = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: SCW, height: SCH))
//        let first = RSNineViewController()
//        let navi = RSNaviViewController.init(rootViewController: first)
//        navi.setNavigationBarHidden(true, animated: true)
        self.window?.rootViewController = RSTwoSeverViewController()
        self.window?.makeKeyAndVisible()
        return true
    }


    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if allRoation{
            return UIInterfaceOrientationMask.all
        }else{
            return UIInterfaceOrientationMask.portrait
        }
    }
    
}

