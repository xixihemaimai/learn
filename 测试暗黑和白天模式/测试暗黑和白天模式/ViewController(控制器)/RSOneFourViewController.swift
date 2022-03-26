//
//  RSOneFourViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneFourViewController: RSBaseViewController {

    var name:String = ""
    
    
    var currentShowVc:UIViewController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("=====================\(name)")
//        self.+(void)popGestureOpen:(UIViewController *)vc
        
//        if self.navigationController?.viewControllers.count == 1{
//            self.currentShowVc = nil
//        }else{
//            self.currentShowVc = self
//        }
//
    }
}

extension RSOneFourViewController:UIGestureRecognizerDelegate{
    
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer{
//            return self.currentShowVc == self.navigationController?.topViewController
//        }
//        return true
//    }
}
