//
//  RSOneNineViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/25.
//

import UIKit

class RSOneNineViewController: RSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let commetview = RSCommentView(frame: CGRect(x: 0, y: 100, width: SCW, height: 50))
        view.addSubview(commetview)
    }
}
