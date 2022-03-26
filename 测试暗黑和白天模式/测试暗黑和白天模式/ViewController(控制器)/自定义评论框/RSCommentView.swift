//
//  RSCommentView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/25.
//

import UIKit


class RSCommentView: UIView {

    
    //添加uitextview
    lazy var textView:UITextView = {
       let textView = UITextView()
        return textView
    }()
    var addHegith:CGFloat = 0.0
    var placeHolderColor:UIColor?
    var placeHolderString:String?
    var placeHolderFont:UIFont?
    
    lazy var placeLabel:UILabel = {
       let placeLabel = UILabel()
       return placeLabel
    }()
    
    
    lazy var sendBtn:UIButton = {
       let sendBtn = UIButton()
        return sendBtn
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.purple
        //这边添加textview
        self.addSubview(textView)
        textView.delegate = self
        textView.backgroundColor = UIColor.green
        textView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-80)
        }
        
        addHegith = self.height/2 - 5.0
        
        addSubview(sendBtn)
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.backgroundColor = UIColor.gray
        sendBtn.isEnabled = false
        sendBtn.setTitleColor(UIColor.white, for: .normal)
        sendBtn.layer.cornerRadius = 5
        sendBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-5)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        //这变要添加默认文字和字体，还有就是颜色
        if placeHolderFont == nil {
            placeHolderFont = UIFont.systemFont(ofSize: 15)
        }
        
        if placeHolderColor == nil{
            placeHolderColor = UIColor.gray
        }
        
        if placeHolderString == nil{
            placeHolderString = "请输入内容"
        }
        
        placeLabel.textColor = placeHolderColor
        placeLabel.font = placeHolderFont
        placeLabel.text = placeHolderString
        placeLabel.textAlignment = .left
        placeLabel.numberOfLines = 0
//        placeLabel.sizeToFit()
        textView.addSubview(placeLabel)
        
        placeLabel.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.top.equalTo(5)
            make.right.equalToSuperview()
        }
        
//        textView.setValue(placeLabel, forKey: "_placeholderLabel")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


extension RSCommentView:UITextViewDelegate{
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeLabel.isHidden = false
        }else{
            //发送信息出来 --- 这里添加一个方法或者代理


            LXFLog(textView.text)
            placeLabel.isHidden = true
        }
    }
    
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty{
            placeLabel.isHidden = false
            sendBtn.isEnabled = false
            sendBtn.backgroundColor = UIColor.gray
        }else{
            placeLabel.isHidden = true
            sendBtn.isEnabled = true
            sendBtn.backgroundColor = UIColor.blue
        }
        //这边要变化高度和
//        LXFLog(textView.text)
        //获取旧的值。然后在设置text的frame,在进行tableview的变化
//        let oldText = textView.frame.size
        //预设textview的大小，宽度设为固定宽度，高度无限大
        let presetSize = CGSize(width: textView.frame.self.width, height: CGFloat.greatestFiniteMagnitude)
        //重新计算textview的实际大小
        let newSize = textView.sizeThatFits(presetSize)
        //更新textview的消息
        textView.frame.size = newSize
        
        self.height = textView.height + addHegith
    }
}
