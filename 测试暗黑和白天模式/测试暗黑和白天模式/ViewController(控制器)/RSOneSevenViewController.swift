//
//  RSOneSevenViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneSevenViewController: UIViewController {

    lazy var tableview: UITableView = {
       let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 44
        tableview.estimatedSectionFooterHeight = 0
        tableview.estimatedSectionHeaderHeight = 0
        if #available(iOS 15.0, *){
            tableview.sectionHeaderTopPadding = 0
        }

        if #available(iOS 13.0, *){
            tableview.contentInsetAdjustmentBehavior = .never
        }else{
            if #available(iOS 11.0, *){
                automaticallyAdjustsScrollViewInsets = false
            }
        }
        return tableview
    }()
    //朋友圈的数组
    var friendList:[FriendModel] = [FriendModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "朋友圈"
//        UIImagePNGRepresentation
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "123")
           
        for _ in 0..<10 {
           let friendModel = FriendModel()
            friendList.append(friendModel)
        }
        tableview.reloadData()
    }
}


class FriendModel:NSObject{
    //昵称
    var name:String = ""
    //头像图片
    var logo:String = ""
    //内容
    var content:String = ""
    //点赞数
    var listNum:Int = 0
    //点赞的数量
    var listStatus:Bool = false
    //评论 --> 也是一个模型，看怎么设计了 ---- 有评论内容，谁发的评论，谁回复的评论 1 自己，2 他
    var pingLun:[String] = [String]()
    //时间
    var date:Date = Date()
    //图片数组
    var pictures:[UIImage] = [UIImage]()
    //地址
    var address:String = ""
    //展开的状态
    var openStatus:Bool = false
    //高度
    var rowHeight:CGFloat = 0.0
}


extension RSOneSevenViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123")!
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let firendmodel = self.friendList[indexPath.row]
        return firendmodel.rowHeight
    }
}


//这边要接收cell中的代理方法，进行处理
