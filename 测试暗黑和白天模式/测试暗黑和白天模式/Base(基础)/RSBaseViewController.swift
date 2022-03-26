//
//  RSBaseViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/16.
//

import UIKit


class RSBaseViewController: UIViewController {
    
    //先设置
    var layout = UICollectionViewFlowLayout()
    //上拉下拉的页数
    var page = 1
    //上拉和下拉是否删除数据
    var isClear = false
    
    
    
    lazy var tableview:UITableView = {
        let tableview = UITableView.init(frame:view.bounds, style: .grouped)
        tableview.separatorStyle = .none
//        if #available(iOS 11.0, *){
            tableview.estimatedSectionFooterHeight = 0
            tableview.estimatedRowHeight = 0
            tableview.estimatedSectionHeaderHeight = 0
//        }
        tableview.backgroundColor = UIColor.colorWithDyColorChangObject(lightColor: "#3385ff", darkColor: "#333333", alpha: 1.0)
        if #available(iOS 11.0, *){
            tableview.contentInsetAdjustmentBehavior = .never
            tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        //这里还要添加俩个代理
        
        
        return tableview
    }()
    
    
    lazy var collection:UICollectionView = {
        let collection = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        return collection
    }()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("------------1--------------------------------------")
        view.backgroundColor = UIColor.yellow
        
//        eat()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("--------3------------------------------------------")
    }
    
    
    func eat(){print("---------------------吃饭")}
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("--------2------------------------------------------")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("-------4-------------------------------------------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("-------5-------------------------------------------")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("--------6------------------------------------------")
    }
    

   
    
    
    

}
