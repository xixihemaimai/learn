//
//  RSTwoFourViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/28.
//

import UIKit

class RSTwoFourViewController: UIViewController{
  
    

    lazy var scrollview:UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.isPagingEnabled = true
        scrollview.bounces = false
       return scrollview
    }()
    
    
    lazy var collectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        layout.itemSize = CGSize(width:(SCW/3), height: SCW/3)
        return collectionview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        LXFLog("----------------")
        //这边要添加uiscrollview视图
        view.addSubview(scrollview)
        scrollview.snp.makeConstraints { make in
            make.right.left.top.equalToSuperview()
            make.height.equalTo(80)
        }
        scrollview.delegate = self
        
        //下边要添加uicollectionview视图
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(scrollview.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
        collectionview.register(RSTwoFourCell.self, forCellWithReuseIdentifier: "123")
//        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind: header, withReuseIdentifier: <#T##String#>)
        collectionview.delegate = self
        collectionview.dataSource = self
        
         
        //添加scrollview的数据并设置滑动范围
        
        for i in 0..<10 {
            let btn = UIButton()
            let x = i * (60 + 10) + 10
            btn.tag = i
            btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
            btn.backgroundColor = UIColor.yellow
            btn.frame = CGRect(x: x, y: 10, width: 60, height: 60)
            scrollview.addSubview(btn)
        }
        scrollview.contentSize = CGSize(width: 10 * (60 + 10) + 10, height: 0)
        
        
        
        
        //下面是设置collectionview的数据和头部视图
        collectionview.backgroundColor = UIColor.red
        
    }
    
    
    @objc func jump(btn:UIButton){
        LXFLog(btn.tag)
    }
    
}

extension RSTwoFourViewController:UIScrollViewDelegate{
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    
}


extension RSTwoFourViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "123", for: indexPath) as! RSTwoFourCell
        return cell
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//
//    }
//
    
    
    
    
}

