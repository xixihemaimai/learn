//
//  RSNaviViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/16.
//

import UIKit

class RSNaviViewController: UINavigationController {

   weak var opdelete:AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("==========================================")
        view.backgroundColor = UIColor.green
        self.opdelete = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print(self.children.count)
        print(self.viewControllers.count)
        if self.children.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: nil, style: .done, target: self, action: #selector(back))
          //这边是返回按键
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func back(){
        self.popViewController(animated: true)
    }
    
}

extension RSNaviViewController:UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //这边是对控制进行是否显示导航栏进行处理
//        var isHidden = false
//        if viewController.isKind(of: RSSelectionCenterViewController.self) || viewController.isKind(of: RSMerChantViewController.self) || viewController.isKind(of: RSBussinessViewController.self) || viewController.isKind(of: RSMyViewController.self) {
//            isHidden = true
//        }else{
//            isHidden = false
//        }
//        self.setNavigationBarHidden(isHidden, animated: true)
//        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if(viewController == viewControllers[0]){
            self.interactivePopGestureRecognizer?.delegate = self.opdelete as? UIGestureRecognizerDelegate
        }else{
            self.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
    }
}
