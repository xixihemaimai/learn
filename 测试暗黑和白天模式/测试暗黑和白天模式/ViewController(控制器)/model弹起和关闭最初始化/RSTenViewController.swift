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
    
    
    lazy var sencondBtn:UIButton = {
        let sencondBtn = UIButton()
        sencondBtn.setTitle("弹起", for: .normal)
        sencondBtn.setTitleColor(UIColor.red, for: .normal)
        return sencondBtn
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
        
        view.addSubview(sencondBtn)
        sencondBtn.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.bottom).offset(10)
            make.left.equalTo(100)
            make.width.height.equalTo(100)
        }
        
        
        btn.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        sencondBtn.addTarget(self, action: #selector(sencondPresntAction), for: .touchUpInside)
        
        
    }
        
    
    
    
    
    @objc func presentAction(btn:UIButton){
        
        let oneVc = RSOneOneViewController()
        oneVc.modalPresentationStyle = .overCurrentContext
        oneVc.addFirstView()
//        oneVc.modalTransitionStyle = .flipHorizontal
        self.present(oneVc, animated: true) {
            
            
        }
    }
    
    
    @objc func sencondPresntAction(btn:UIButton){
        let oneVc = RSOneOneViewController()
        oneVc.modalPresentationStyle = .overCurrentContext
//        oneVc.modalTransitionStyle = .flipHorizontal
        oneVc.addSecondView()
        self.present(oneVc, animated: true) {
            
        }
    }
}
