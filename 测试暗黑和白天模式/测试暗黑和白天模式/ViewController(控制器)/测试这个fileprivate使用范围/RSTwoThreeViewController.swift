//
//  RSTwoThreeViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/27.
//

import UIKit

class RSTwoThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let customView = RSCustomView(frame: CGRect(x: 10, y: 100, width: 100, height: 100))
        customView.backgroundColor = UIColor.yellow
        view.addSubview(customView)
        
        
    }

}
