//
//  RSOneThreeViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneThreeViewController: RSBaseViewController {

    
    lazy var scrollview:UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.backgroundColor = UIColor.green
        return scrollview
    }()
    
    var data:[Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollview)
        scrollview.delegate = self
        scrollview.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(10)
            make.height.equalTo(120)
        }
        addData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    func addData(){
        for i in 0...9 {
            data.append(Int(i))
        }
        for i in 0..<data.count{
           let btn = UIButton()
            btn.tag = i
            btn.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
            scrollview.addSubview(btn)
            btn.backgroundColor = UIColor.purple
            btn.frame = CGRect(x: CGFloat(i * 100) + CGFloat(i * 10), y: 10, width: 100, height: 100)
        }
        scrollview.contentSize = CGSize(width: data.count * 100 + data.count * 10, height: 0)
    }
    
    
    
    
    @objc func jumpAction(btn:UIButton){
        let oneFour = RSOneFourViewController()
        oneFour.name = "你好"
        self.navigationController?.pushViewController(oneFour, animated: true)
    }
}

extension RSOneThreeViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
    
}
