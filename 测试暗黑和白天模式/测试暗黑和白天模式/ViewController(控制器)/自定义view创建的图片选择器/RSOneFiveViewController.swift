//
//  RSOneFiveViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneFiveViewController: UIViewController {

   
    var selectPhotoView:RSMLSelectPhotosView = RSMLSelectPhotosView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addData()
        view.addSubview(selectPhotoView)
        selectPhotoView.viewController = self
        selectPhotoView.backgroundColor = UIColor.green
        selectPhotoView.snp.makeConstraints({ make in
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.bottom.equalTo(view)
            make.top.equalTo(view).offset(10)
        })
    }
    
//    func addData(){
//        data.append(UIImage())
//    }

}

