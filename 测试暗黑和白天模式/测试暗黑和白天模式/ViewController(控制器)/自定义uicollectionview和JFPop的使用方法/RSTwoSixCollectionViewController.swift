//
//  RSTwoSixCollectionViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import UIKit

class RSTwoSixCollectionViewController: UIViewController {

    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: CGFloat((SCW - 25)/2), height: CGFloat((SCW - 25)/2))
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var data:[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        if #available(iOS 13.0, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        collectionView.backgroundColor = UIColor.red
        collectionView.register(RSTwoSixCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(RSTwoSixReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ccee")
        
    }
    
    
    func addData(){
        for _ in 0...9{
            data.append("1")
        }
        collectionView.reloadData()
    }
}


extension RSTwoSixCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ccee", for: indexPath) as! RSTwoSixReusableView
            header.title = "1"
            header.backgroundColor = UIColor.orange
            return header
        }else{
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RSTwoSixCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        userManager.share.isLoginPresentVc(currentVc: self) { otherVc in
            //这边是已经登录的地方
            
            otherVc.navigationController?.pushViewController(UIViewController(), animated: true)
        }
    
    }
    
}
