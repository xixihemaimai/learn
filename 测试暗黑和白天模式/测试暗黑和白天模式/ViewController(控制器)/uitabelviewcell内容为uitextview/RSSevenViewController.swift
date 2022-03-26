//
//  RSSevenViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/21.
//

import UIKit

class RSSevenViewController: RSBaseViewController {

    lazy var textTableView:UITableView = {
        let textTableView = UITableView.init(frame: view.bounds, style: .plain)
        textTableView.delegate = self
        textTableView.dataSource = self
        textTableView.estimatedRowHeight = 100
        textTableView.estimatedSectionFooterHeight = 0
        textTableView.estimatedSectionHeaderHeight = 0
        textTableView.separatorStyle = .none
        textTableView.rowHeight = UITableView.automaticDimension
        return textTableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "tableview里面uitextview无限变大"
        //在UItableview或者uicollectionview里面设置这些都是会有复用的问题
        view.addSubview(self.textTableView)
        self.textTableView.register(RSSevenCell.self, forCellReuseIdentifier: "seven")
    
        textTableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: ""), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(jump), name: NSNotification.Name.init(rawValue: ""), object: nil)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @objc func jump(){
        
    }

}


extension RSSevenViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seven") as! RSSevenCell
        cell.textView.delegate = self
        return cell
    }
}


extension RSSevenViewController:UITextViewDelegate{
    
    func  textViewDidChange(_ textView: UITextView) {
        LXFLog(textView.text)
        //获取旧的值。然后在设置text的frame,在进行tableview的变化
        let oldText = textView.frame.size
        //预设textview的大小，宽度设为固定宽度，高度无限大
        let presetSize = CGSize(width: textView.frame.self.width, height: CGFloat.greatestFiniteMagnitude)
        //重新计算textview的实际大小
        let newSize = textView.sizeThatFits(presetSize)
        //更新textview的消息
        textView.frame.size = newSize
        if newSize.height != oldText.height{
            self.textTableView.beginUpdates()
            self.textTableView.endUpdates()
        }
    }
}
