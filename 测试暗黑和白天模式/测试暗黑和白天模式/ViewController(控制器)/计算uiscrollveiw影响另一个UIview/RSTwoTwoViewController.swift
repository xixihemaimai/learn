//
//  RSTwoTwoViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/26.
//

import UIKit

class RSTwoTwoViewController: UIViewController {

    
    //uiscrollview
    lazy var scrollview:UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.delegate = self
        return scrollview
    }()
    
    //创建一个UIview
    lazy var outView:UIView = {
       let outView = UIView()
        outView.backgroundColor = UIColor.red
        return outView
    }()
    
    //创建一个uiview里面UIview
    lazy var inView:UIView = {
       let inView = UIView()
        inView.backgroundColor = UIColor.blue
        return inView
    }()
    
    //创建一个数组
    var data:[Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.white
        view.addSubview(scrollview)
        scrollview.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(120)
        }
        
        view.addSubview(outView)
        outView.layer.cornerRadius = 4
        outView.snp.makeConstraints { make in
            make.top.equalTo(scrollview.snp.bottom).offset(10)
            make.width.equalTo(SCW/10)
            make.centerX.equalToSuperview()
            make.height.equalTo(8)
        }
        
        
        outView.addSubview(inView)
        inView.layer.cornerRadius = 4
        inView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(15)
        }
        
        for i in 0..<7 {
            let btn = UIButton()
            btn.frame = CGRect(x: i * (100 + 10) + 10, y: 10, width: 100, height: 100)
            btn.backgroundColor = UIColor.orange
            data.append(i)
            scrollview.addSubview(btn)
        }
        scrollview.contentSize = CGSize(width: data.count * (100 + 10) + 10, height: 0)
        outView.width = scrollview.contentSize.width / 10
    }
}

extension RSTwoTwoViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //这边要做对比
        let bi = outView.width/scrollView.contentSize.width
        inView.x = bi * scrollView.contentOffset.x
        LXFLog(inView.x)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //这边要做对比
//        let bi = outView.width/scrollView.width
//        inView.x = bi * scrollView.contentOffset.x
    }
    
    
}
