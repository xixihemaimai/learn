//
//  RSTwoSeverViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/1.
//

import UIKit
import JFPopup

class RSTwoSeverViewController: UIViewController {

    lazy var customTableView:RSCustomTableView = {
        let customTableView = RSCustomTableView(frame: view.bounds, style: .plain)
        return customTableView
    }()
    
    
    lazy var btn:UIButton = {
       let btn = UIButton()
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LXFLog("-----------------------")
        view.addSubview(customTableView)
        customTableView.backgroundColor = UIColor.green
        customTableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
        btn.tag = 0
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        
    }
    
    @objc func testAction(btn:UIButton){
        switch btn.tag{
        case 0:
            //这边对这个
            JFPopup.dialog { mainContainer in
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                view.backgroundColor = UIColor.yellow
                return view
            }
        case 1:
            JFPopup.drawer { mainContainer in
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: SCH))
                view.backgroundColor = UIColor.red
                return view
            }
        case 2:
            JFPopup.drawer(with: .right, isDismissible: true, enableDrag: true, bgColor: UIColor.gray) { mainContainer in
                let view = UIView(frame:CGRect(x: 0, y: 0, width: 300, height: SCH))
                view.backgroundColor = UIColor.orange
                return view
            }
        case 3:
            JFPopup.bottomSheet { mainContainer in
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
        if btn.tag == 6{
            btn.tag = 0
        }else
        {
            btn.tag += 1
        }
    }
}
