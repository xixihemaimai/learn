//
//  RSTenViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/23.
//

import UIKit

class RSTenViewController: RSBaseViewController {

    lazy var btn:UIButton = {
       let btn = UIButton()
        btn .setTitle("弹起", for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(100)
            make.width.height.equalTo(100)
        }
        
        btn.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
    }
        
    
    
    
    
    @objc func presentAction(btn:UIButton){
        
        let oneVc = RSOneOneViewController()
        oneVc.modalPresentationStyle = .overCurrentContext
//        oneVc.modalTransitionStyle = .flipHorizontal
        self.present(oneVc, animated: true) {
            
            
        }
    }
}
