//
//  RSNineViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/21.
//

import UIKit

class RSNineViewController: RSBaseViewController {

    lazy var showTableview:UITableView = {
       let showTableView = UITableView()
        showTableView.estimatedRowHeight = 44
        showTableView.estimatedSectionHeaderHeight = 0
        showTableView.estimatedSectionFooterHeight = 0
        showTableView.rowHeight = UITableView.automaticDimension
        showTableView.delegate = self
        showTableView.dataSource = self
        showTableView.separatorStyle = .none
        if #available(iOS 15.0, *){
            showTableView.sectionHeaderTopPadding = 0.0
        }
        return showTableView
    }()
    
    private var listData:[Int] = [Int]()
    private var showListData:[Bool] = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "展开和关闭"
        
        view.addSubview(showTableview)
        showTableview.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        showTableview.register(UITableViewCell.self, forCellReuseIdentifier: "show")
        showTableview.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        for i in 0...9{
            LXFLog(i)
            listData.append(i)
            let isShow = false
            showListData.append(isShow)
        }
        LXFLog("66666\(String(describing: listData.count))")
        self.showTableview.reloadData()
    }
}


extension RSNineViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let isShow = self.showListData[section]
        LXFLog(isShow)
        if isShow{
            return 5
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let view = UIView()
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        view?.isUserInteractionEnabled = true
//        view?.addGestureRecognizer(UIGestureRecognizer)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(openAndCloseAction))
        view?.tag = section
        view?.addGestureRecognizer(tap)
        view?.contentView.backgroundColor = UIColor.orange
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "show")
        cell?.textLabel!.text = String(indexPath.row)
        return cell!
    }
    
    
    @objc func openAndCloseAction(tap:UITapGestureRecognizer){
        //从这里获取
        let index = (tap.view?.tag)!
        var isShow = self.showListData[index]
        isShow = !isShow
        self.showListData[index] = isShow
        self.showTableview.reloadSections(IndexSet.init(integer: index), with: .none)
    }
}
