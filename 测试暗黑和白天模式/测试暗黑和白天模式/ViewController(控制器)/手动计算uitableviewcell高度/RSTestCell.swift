//
//  RSTestCell.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/19.
//

import UIKit
import SnapKit


protocol RSTestCellDelegate:NSObjectProtocol{
    func open(index:Int,isSelect:Bool)
}


class RSTestCell: UITableViewCell {
    
    weak var cellDelegate:RSTestCellDelegate?
    fileprivate var testLabel:UILabel!
    fileprivate var nameLabel:UILabel!
    fileprivate var ImageContentImage:RSImageContentView!
    fileprivate var checkAllBtn:UIButton!
    
//    var checkAll:Bool = false
    
//    var modelData:model?{
//        didSet{
//
//            guard var modelData = modelData else {
//                return
//            }
//            testLabel.text = modelData.text
//            nameLabel.text = modelData.name
//            let testHeight = countHeight(text: testLabel.text!)
//            //这里计算下高度
//            testLabel.snp.updateConstraints({ make in
//                make.height.equalTo(testHeight)
//            })
//            print("=============\(tag)=============\(checkAllBtn.isSelected)")
//            checkAllBtn.isSelected = modelData.checkAll
//            let nameHeight = countHeight(text: nameLabel.text!)
//            if nameHeight > 80 {
//                checkAllBtn.isHidden = false
//                if modelData.checkAll == true{
//                    nameLabel.snp.updateConstraints({ make in
//                        make.height.equalTo(nameHeight)
//                    })
//                    checkAllBtn.setTitle("收取", for: .normal)
//                }else{
//                    checkAllBtn.setTitle("展开", for: .normal)
//                    nameLabel.snp.updateConstraints({ make in
//                        make.height.equalTo(80)
//                    })
//                }
//            }else{
//                nameLabel.snp.updateConstraints({ make in
//                    make.height.equalTo(nameHeight)
//                })
//                checkAllBtn.isHidden = true
//            }
//            for view in ImageContentImage.subviews {
//                view.removeFromSuperview()
//            }
//            // 这边要判断有多少张图片
//            ImageContentImage.pintures = modelData.pintures
//            var imageHeigth:CGFloat = 0.0
//            if ImageContentImage.pintures!.count <= 3{
//                imageHeigth = 110
//            }else if ImageContentImage.pintures!.count <= 6{
//                imageHeigth = 215
//            }else{
//                imageHeigth = 330
//            }
//            ImageContentImage.snp.updateConstraints { make in
//                make.height.equalTo(imageHeigth)
//            }
//            modelData.rowHeight = ImageContentImage.bottom
//        }
//    }
    
    
    func reloadView(modelData:model){
//        guard var modelData = modelData else {
//            return
//        }
        testLabel.text = modelData.text
        nameLabel.text = modelData.name
        let testHeight = countHeight(text: testLabel.text!)
        //这里计算下高度
//        testLabel.snp.updateConstraints({ make in
//            make.height.equalTo(testHeight)
//        })
        
        testLabel.height = testHeight
        print("=============\(tag)=============\(checkAllBtn.isSelected)")
        nameLabel.y = testLabel.bottom
        checkAllBtn.isSelected = modelData.checkAll ?? false
        let nameHeight = countHeight(text: nameLabel.text!)
        if nameHeight > 80 {
            checkAllBtn.isHidden = false
            if modelData.checkAll == true{
//                nameLabel.snp.updateConstraints({ make in
//                    make.height.equalTo(nameHeight)
//                })
                nameLabel.height = nameHeight
                checkAllBtn.height = 30
                checkAllBtn.setTitle("收取", for: .normal)
            }else{
                checkAllBtn.setTitle("展开", for: .normal)
                nameLabel.height = 80
//                nameLabel.snp.updateConstraints({ make in
//                    make.height.equalTo(80)
//                })
                checkAllBtn.height = 30
            }
        }else{
            nameLabel.height = nameHeight
//            nameLabel.snp.updateConstraints({ make in
//                make.height.equalTo(nameHeight)
//            })
            checkAllBtn.isHidden = true
            checkAllBtn.height = 0
        }
        checkAllBtn.y = nameLabel.bottom
        for view in ImageContentImage.subviews {
            view.removeFromSuperview()
        }
        // 这边要判断有多少张图片
        ImageContentImage.pintures = modelData.pintures
        var imageHeigth:CGFloat = 0.0
        //111
        
        LXFLog(ImageContentImage.pintures?.count)
        
        if ImageContentImage.pintures!.count == 1{
            imageHeigth = 200
        }else if ImageContentImage.pintures!.count == 2{
            imageHeigth = 180
        }else if ImageContentImage.pintures!.count == 3{
            imageHeigth = 131
        }else if ImageContentImage.pintures!.count == 4{
            imageHeigth = 400
        }else if ImageContentImage.pintures!.count == 5{
            imageHeigth = 310
        }
        else if ImageContentImage.pintures!.count == 6 {
            imageHeigth = 365
        }else{
            imageHeigth = 385
        }
//        ImageContentImage.snp.updateConstraints { make in
//            make.height.equalTo(imageHeigth)
//        }
        ImageContentImage.y = checkAllBtn.bottom
        ImageContentImage.height = imageHeigth
        modelData.rowHeight = ImageContentImage.bottom
    }
    
    
    //计算文字的高度
    fileprivate func countHeight(text:String)->CGFloat{
        let normalText:NSString = text as NSString
        let height = normalText.boundingRect(with: CGSize(width: contentView.bounds.width - 20, height: 0), options: .usesLineFragmentOrigin, attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)] , context: nil).height
        return height
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
         //添加界面
        testLabel = UILabel()
        testLabel.textColor = UIColor.green
        testLabel.frame = CGRect(x: 10, y: 0, width: SCW - 20, height: 0)
        testLabel.font = UIFont.systemFont(ofSize: 15)
        testLabel.numberOfLines = 0
        testLabel.textAlignment = .left
        contentView.addSubview(testLabel)
//        testLabel.snp.makeConstraints { make in
//            make.left.equalTo(contentView).offset(10)
//            make.right.equalTo(contentView).offset(-10)
//            make.top.equalTo(contentView)
//            make.height.equalTo(0)
//        }
        
        nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.frame = CGRect(x: 10, y: testLabel.bottom, width: SCW - 20, height: 0)
        nameLabel.textColor = UIColor.green
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
//        nameLabel.snp.makeConstraints { make in
//            make.left.equalTo(contentView).offset(10)
//            make.right.equalTo(contentView).offset(-10)
//            make.top.equalTo(testLabel.snp.bottom)
//            make.height.equalTo(0)
//        }
        
        checkAllBtn = UIButton()
        checkAllBtn.setTitle("展开", for: .normal)
        checkAllBtn.frame = CGRect(x: 10, y: nameLabel.bottom, width: 80, height: 30)
        checkAllBtn.contentHorizontalAlignment = .left
        checkAllBtn.setTitleColor(UIColor.blue, for: .normal)
        checkAllBtn.addTarget(self, action: #selector(openAction), for: .touchUpInside)
        contentView.addSubview(checkAllBtn)
//        checkAllBtn.snp.makeConstraints { make in
//            make.left.equalTo(contentView).offset(10)
//            make.top.equalTo(nameLabel.snp.bottom)
//            make.width.equalTo(80)
//            make.height.equalTo(30)
//        }
        
        ImageContentImage = RSImageContentView()
        ImageContentImage.frame = CGRect(x: 0, y: checkAllBtn.bottom, width: SCW, height: 0)
        ImageContentImage.backgroundColor = UIColor.white
        contentView.addSubview(ImageContentImage)
//        ImageContentImage.snp.makeConstraints { make in
//            make.left.equalTo(10)
//            make.right.equalTo(-10)
//            make.top.equalTo(checkAllBtn.snp.bottom).offset(10)
//            make.height.equalTo(0)
//        }
        
//        contentView.snp.makeConstraints{ make in
//            make.bottom.equalTo(ImageContentImage.snp.bottom)
//            make.leading.equalTo(self)
//            make.top.equalTo(self)
//            make.trailing.equalTo(self)
//        }
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
    
    
    
    @objc func openAction(btn:UIButton){
//        print("-----------------------\(tag)------------------\(btn.isSelected)")
        btn.isSelected = !btn.isSelected
        if btn.isSelected{
            btn.setTitle("收取", for: .normal)
        }else{
            btn.setTitle("展开", for: .normal)
        }
//        modelData?.checkAll = btn.isSelected
//        checkAll = btn.isSelected
//        print("----1111-------------------\(tag)------------------\(btn.isSelected)")
        self.cellDelegate?.open(index: tag, isSelect: btn.isSelected)
    }
}
