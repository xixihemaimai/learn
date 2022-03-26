//
//  RSSevenCell.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/21.
//

import UIKit

class RSSevenCell: UITableViewCell {
    
    fileprivate var lable:UILabel!
    var textView:UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lable = UILabel()
        lable.text = "写入值"
        lable.textAlignment = .left
        lable.textColor = UIColor.yellow
        contentView.addSubview(lable)
        
        textView = UITextView()
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.green
        textView.textAlignment = .left
        textView.textColor = UIColor.red
        contentView.addSubview(textView)
        
        
        lable.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        
        textView.snp.makeConstraints { make in
            make.left.equalTo(lable.snp.right).offset(2)
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
