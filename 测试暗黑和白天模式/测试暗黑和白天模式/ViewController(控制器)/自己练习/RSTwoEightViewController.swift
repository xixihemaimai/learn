//
//  RSTwoEightViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/1.
//

import UIKit


class RSTwoEightViewController: UIViewController {
    
    lazy var scrolleview:UIScrollView = {
       let scorllview = UIScrollView()
        scrolleview.isPagingEnabled = true
        scrolleview.bounces = true
        scrolleview.delegate = self
        scorllview.contentSize = CGSize(width: 1000, height: 0)
        return scrolleview
    }()
    
    
    var a:Int
    
    var b:Int{
        return 10
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加页面和工具类
        let showView = UIView(frame: CGRect(x: 10, y: 100, width: SCW - 20, height: 300))
        view.addSubview(showView)
        showView.layer.shadowColor = UIColor.yellow.cgColor
        showView.layer.shadowRadius = 10
        showView.layer.shadowOpacity = 0.5
        showView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        let bluf = UIBlurEffect(style: .dark)
        let vistview = UIVisualEffectView(effect: bluf)
        vistview.bounds = showView.bounds
        showView.addSubview(vistview)
        
        view.addSubview(scrolleview)
        scrolleview.snp.makeConstraints { make in
            make.top.equalTo(showView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        for i in 0...10 {
            let btn = UIButton()
            btn.setTitle(String(i), for: .normal)
            btn.setTitleColor(UIColor.yellow, for: .normal)
            btn.setTitleColor(UIColor.green, for: .selected)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            btn.tag = i
            btn.addTarget(self, action:#selector(jump), for: .touchUpInside)
            btn.frame = CGRect(x: i * 50 + i + 5, y: 10, width: 50, height: 50)
            scrolleview.addSubview(btn)
        }
        
        
        
        let tableview = UITableView(frame: view.bounds, style: .plain)
        tableview.estimatedRowHeight = 0
        tableview.estimatedSectionFooterHeight = 0
        tableview.estimatedSectionHeaderHeight = 0
        view.addSubview(tableview)
        tableview.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCW, height: 100))
        tableview.tableFooterView = UIView()
        
        
        

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.headerReferenceSize = CGSize(width: SCW, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionview = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(scrolleview.snp.bottom)
        }
    }
    
    
    @objc func jump(btn:UIButton){
        LXFLog(btn.tag)
    }
}


extension RSTwoEightViewController:UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        LXFLog(scrolleview.contentOffset.x)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        LXFLog(scrolleview.contentOffset.x)
    }
}

