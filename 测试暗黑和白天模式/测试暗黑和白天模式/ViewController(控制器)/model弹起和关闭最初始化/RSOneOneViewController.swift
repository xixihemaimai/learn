//
//  RSOneOneViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/23.
//

import UIKit

class RSOneOneViewController: UIViewController {
    
    lazy var btn:UIButton = {
       let btn = UIButton()
        btn.setTitle("下降", for: .normal)
        return btn
    }()
    
    lazy var placeHolder:UILabel = {
       let placeHolder = UILabel()
        placeHolder.numberOfLines = 0
        placeHolder.textColor = UIColor.yellow
        placeHolder.text = "开始编辑了"
        placeHolder.font = UIFont.systemFont(ofSize: 12)
        return placeHolder
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        
        let showView = UIView()
        showView.backgroundColor = UIColor.black
        view.addSubview(showView)
        showView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        showView.alpha = 0.2
        
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.width.height.equalTo(100)
        }
     
        btn.addTarget(self, action: #selector(downClick), for: .touchUpInside)
        
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(downAction))
        showView.addGestureRecognizer(tap)
        
        
        let textview = UITextView()
        textview.delegate = self
        view.addSubview(textview)
        textview.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(btn.snp.bottom).offset(5)
            make.height.equalTo(100)
        }
        
        textview.addSubview(self.placeHolder)
        
        self.placeHolder.snp.makeConstraints { make in
//            make.left.right.top.equalTo(textview)
            make.left.equalTo(8)
            make.top.equalTo(5)
            make.right.equalTo(-20)
            make.height.equalTo(20)
        }
        
    }
    
    @objc func downAction(tap:UITapGestureRecognizer){
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func downClick(btn:UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}

extension RSOneOneViewController:UITextViewDelegate{
    
    //开始编辑
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            placeHolder.isHidden = false
        }else{
            placeHolder.isHidden = true
        }
    }
    
    //已经开始输入
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty{
            placeHolder.isHidden = false
        }else{
            placeHolder.isHidden = true
        }
    }
    
    //结束编辑
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            placeHolder.isHidden = false
        }else{
            placeHolder.isHidden = true
        }
    }
    
    
    
}
