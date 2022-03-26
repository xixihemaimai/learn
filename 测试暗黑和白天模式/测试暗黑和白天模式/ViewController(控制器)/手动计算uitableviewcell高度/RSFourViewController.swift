//
//  RSFourViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/19.
//

import UIKit



class model:NSObject{
    var text:String?
    var name:String?
//    var cellHeight:CGFloat = 0.0
    var pintures:[String]?
    var checkAll:Bool?
    var rowHeight:CGFloat?
}

class RSFourViewController: RSBaseViewController {

    lazy var testview:UITableView = {
        let testview = UITableView.init(frame: view.bounds, style: .plain)
        if #available(iOS 15.0, *){
            testview.sectionHeaderTopPadding = 0
        }
        if #available(iOS 13.0, *){
            testview.contentInsetAdjustmentBehavior = .never
        }
        testview.delegate = self
        testview.dataSource = self
        testview.backgroundColor = UIColor.yellow
        testview.estimatedRowHeight = 0
        testview.estimatedSectionHeaderHeight = 0
        testview.estimatedSectionFooterHeight = 0
        // 设置 tabelView 行高,自动计算行高
        testview.separatorStyle = .none
//        testview.rowHeight = UITableView.automaticDimension
        return testview
    }()
    
    
    var list:[model] = [model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.testview)
        testview.register(RSTestCell.self, forCellReuseIdentifier: "test")
        relaod()
        testview.reloadData()
    }
    
    
    //这边自己配置下数据
    
    func relaod(){
       for i in 0..<10{
        switch i{
            case 0:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试是白天还是晚上还是真的在数据变化中测试是白天还是晚上还是真的在数据变化中"
            
            model.pintures = ["123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 1:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试是白天还是晚上还是真的在数据变化中测试是白天还是晚上还是真的在数据变化中"
            
            model.pintures = ["123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 2:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试是白天还是晚上还是真的在数据变化中测试是白天还是晚上还是真的在数据变化中"
            
            model.pintures = ["123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 3:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真"
            
            model.pintures = ["123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 4:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在"
            
            model.pintures = ["123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 5:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的"
            
            model.pintures = ["123","123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 6:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试是白天还是晚上还是真的在数据变化中测试是白天还是晚上还是真的在数据变化中"
            model.pintures = ["123","123","123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 7:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据中"
            
            model.pintures = ["123","123","123","123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 8:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试"
            
            model.pintures = ["123","123","123","123","123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
            case 9:
            let model = model()
            model.text = "测试是白天还是晚上还是真的在数据变化中"
            model.name = "测试是白天还是晚上还是真的在数据变化中测试是白真的在数是晚上还是真的在数据变化中的在数据变化中测试是白真的在数据变化中测试是白天还是晚上还是真的在数据变化中测试是白天还是晚上还是真的在数据变化中"
            
            model.pintures = ["123","123","123","123","123","123","123","123","123"]
            model.checkAll = false
            model.rowHeight = 100.0
            list.append(model)
         default:
            break
          }
    
        }
       
    }

}



extension RSFourViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //  这边要通过计算
        let model = list[indexPath.row]
//        LXFLog("---------2---------\(model.rowHeight)-----------\(indexPath.row)")
//        return UITableView.automaticDimension
//        LXFLog(model)
        return model.rowHeight ?? 0
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! RSTestCell
        //这边要传数据过UItableviewcell
        cell.tag = indexPath.row
        let modelData = list[indexPath.row]
        cell.cellDelegate = self
        cell.selectionStyle = .none
        cell.reloadView(modelData: modelData)
//        LXFLog("===1=====\(modelData.rowHeight)------------------\(indexPath.row)")
        LXFLog(modelData)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = list[indexPath.row]
        LXFLog(model.rowHeight)
    }
    
}

extension RSFourViewController:RSTestCellDelegate{
    func open(index: Int, isSelect: Bool) {
        let index = IndexPath(row: index, section: 0)
        let model = list[index.row]
        model.checkAll = isSelect
        testview.reloadRows(at: [index], with: .none)
    }
}


