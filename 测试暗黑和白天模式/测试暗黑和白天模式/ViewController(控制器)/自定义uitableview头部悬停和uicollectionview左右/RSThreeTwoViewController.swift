//
//  RSThreeTwoViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/4.
//

import UIKit

class RSThreeTwoViewController: UIViewController {

    
    lazy var tableview:UITableView = {
        let tableview = UITableView(frame: view.bounds, style: .plain)
       return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "cellheader")
        
        tableview.dataSource = self
        tableview.delegate = self
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: SCW, height: 100))
        view.backgroundColor = UIColor.yellow
        tableview.setNeedsLayout()
        tableview.layoutIfNeeded()
        tableview.tableHeaderView = view
        
    }
}

extension RSThreeTwoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")!
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = tableview.dequeueReusableHeaderFooterView(withIdentifier: "cellHeader")
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 100
    }
    
}
