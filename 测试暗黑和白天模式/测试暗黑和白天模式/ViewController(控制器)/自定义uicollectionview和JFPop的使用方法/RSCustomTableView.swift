//
//  RSCustomTableView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/1.
//

import UIKit
import JFPopup

class RSCustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style){
        super.init(frame: frame, style: style)
        
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        if #available(iOS 13.0, *){
            self.contentInsetAdjustmentBehavior = .never
        }
        if #available(iOS 15.0, *){
            self.sectionHeaderTopPadding = 0
        }
        self.delegate = self
        self.dataSource = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: "ceaa")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RSCustomTableView:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ceaa")!
        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.textColor = UIColor.orange
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //automaticDimension
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row{
        case 0:
            //这边对这个
            self.popup.dialog { mainContainer in
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
                view.backgroundColor = UIColor.yellow
                return view
            }
        case 1:
            
            self.popup.drawer { mainContainer in
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: SCH))
                view.backgroundColor = UIColor.red
                return view
            }
            
        case 2:
            
            self.popup.drawer(with: .right, isDismissible: true, enableDrag: true, bgColor: UIColor.gray) { mainContainer in
                let view = UIView(frame:CGRect(x: 0, y: 0, width: 300, height: SCH))
                view.backgroundColor = UIColor.orange
                return view
            }
            
            
        case 3:
            
            self.popup.bottomSheet { mainContainer in
                let view = UIView(frame:CGRect(x: 0, y: 0, width: SCW, height: 200))
                view.backgroundColor = UIColor.purple
                return view
            }
            
        case 4:
            JFPopupView.popup.toast(hit: "支付成功", icon: .success)
        case 5:
            JFPopupView.popup.toast(hit: "支付失败", icon: .fail)
        case 6:
            self.popup.actionSheet {
                [JFPopupAction(with: "拍摄", subTitle: "照相和照片") {
                    LXFLog("拍摄")
                },
                
                JFPopupAction(with: "用手机拍摄", subTitle: nil, autoDismiss: true) {
                    LXFLog("手机")
                },
                
                JFPopupAction(with: "用秒剪制作视频", subTitle: nil, autoDismiss: true) {
                  LXFLog("视频")
                }]
            }
        case 7:
            break
        case 8:
            break
        case 9:
            break
        default:
            break
            
            
            
        }
       
        
    }
    
    
}
