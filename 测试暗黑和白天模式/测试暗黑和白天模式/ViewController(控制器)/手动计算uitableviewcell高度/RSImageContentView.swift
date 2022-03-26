//
//  RSImageContentView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/19.
//

import UIKit

class RSImageContentView: UIView {

    //数组
    
    //每行显示三个
    fileprivate let imgCount: CGFloat = 3.0
    //每个图片宽度
    //[UIScreen mainScreen].bounds.size.width-(corlmax + 1) * margin) / corlmax
    fileprivate let imageWH = (SCW - (3 + 1) * 10)/3.0
    //间隙
    fileprivate let padding = 10.0
    
    
    var pintures:[String]?{
        didSet{
            //先创建九张图
            guard let array = pintures?.count else{
                return
            }
            LXFLog(array)
            for index in 0..<array {
                if array == 6{
                    if index == 0{
                        //第一张图片
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        let imageWH = (SCW - (2 + 1) * 10) - imageWH
                        img.snp.makeConstraints { make in
                            make.left.equalTo(10)
                            make.top.equalToSuperview()
                            make.width.equalTo(imageWH)
                            make.height.equalTo(imageWH)
                        }
                    }else if index == 1{
                        //第二张图片
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.top.equalToSuperview()
                            make.right.equalTo(self).offset(-10)
                            make.width.height.equalTo(imageWH)
                        }
                    }else if index == 2{
                        //第三张图
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.top.equalTo(self).offset(imageWH + 10)
                            make.right.equalTo(self).offset(-10)
                            make.width.height.equalTo(imageWH)
                        }
                    }else if index == 3{
                        //第四张图片
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.bottom.equalTo(self).offset(-10)
                            make.left.equalTo(self).offset(10)
                            make.width.height.equalTo(imageWH)
                        }
                    }else if index == 4{
                        //第五张图片
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.centerX.equalToSuperview()
                            make.bottom.equalTo(self).offset(-10)
                            make.width.height.equalTo(imageWH)
                        }
                    }else{
                        //第六张图片
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.bottom.equalTo(self).offset(-10)
                            make.right.equalTo(self).offset(-10)
                            make.width.height.equalTo(imageWH)
                        }
                    }
                }else if array == 2{
                    let colom = index % Int(imgCount)
                    let imageWh = (SCW - (2 + 1) * 10)/2
                    let X = CGFloat(colom) * (imageWh + padding) + padding
                    let img = UIImageView()
                    img.backgroundColor = UIColor.green
                    self.addSubview(img)
                    img.snp.makeConstraints { make in
                        make.left.equalTo(X)
                        make.top.equalToSuperview()
                        make.width.height.equalTo(imageWh)
                    }
                }else if array == 1{
                    let img = UIImageView()
                    img.backgroundColor = UIColor.green
                    self.addSubview(img)
                    img.snp.makeConstraints { make in
                        make.left.equalToSuperview().offset(10)
                        make.right.equalToSuperview().offset(-10)
                        make.top.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                }else if array == 4{
                    let imageWh = (SCW - (2 + 1) * 10)/2
                    let colom = index % 2
                    let row = index / 2
                    let Y = CGFloat(row) * (imageWh + padding) + padding
                    let X = CGFloat(colom) * (imageWh + padding) + padding
                    let img = UIImageView()
                    img.backgroundColor = UIColor.green
                    self.addSubview(img)
                    img.snp.makeConstraints { make in
                        make.left.equalTo(X)
                        make.top.equalTo(Y)
                        make.width.height.equalTo(imageWh)
                    }
                }
                else if array == 5{
                    if index == 0 || index == 1{
                        //上面显示俩个
                        let imageWh = (SCW - (2 + 1) * 10)/2
                        let colom = index % 2
                        let row = index / 2
                        let Y = CGFloat(row) * (imageWh + padding) + padding
                        let X = CGFloat(colom) * (imageWh + padding) + padding
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.left.equalTo(X)
                            make.top.equalTo(Y)
                            make.width.height.equalTo(imageWh)
                        }
                    }else{
                        //下面显示3个
//                        let topimageWh = (SCW - (2 + 1) * 10)/2
                        let imageWh = (SCW - (3 + 1) * 10)/3
                        let colom = index % 3
//                        let row = index / 3
//                        let Y = CGFloat(row) * (imageWh + padding) + padding
                        let X = CGFloat(colom) * (imageWh + padding) + padding
                        let img = UIImageView()
                        img.backgroundColor = UIColor.green
                        self.addSubview(img)
                        img.snp.makeConstraints { make in
                            make.left.equalTo(X)
                            make.bottom.equalTo(-10)
                            make.width.height.equalTo(imageWh)
                        }
                    }
                }
                else{
                    //求余,用于X轴索引(每一行达到3的整数时,求余就是零)
                    let colom = index % Int(imgCount)
                    let row = index / Int(imgCount)
                    let Y = CGFloat(row) * (imageWH + padding) + padding
                    let X = CGFloat(colom) * (imageWH + padding) + padding
                    let img = UIImageView()
                    img.backgroundColor = UIColor.green
                    self.addSubview(img)
                    img.snp.makeConstraints { make in
                        make.left.equalTo(X)
                        make.top.equalTo(Y)
                        make.width.height.equalTo(imageWH)
                    }
                }
            }
        }
    }

    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
