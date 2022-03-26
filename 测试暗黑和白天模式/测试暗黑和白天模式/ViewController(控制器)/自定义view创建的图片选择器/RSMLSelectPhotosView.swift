//
//  RSMLSelectPhotosView.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSMLSelectPhotosView: UIView {
    
    var viewController:UIViewController?

    lazy var collectionView:UICollectionView = {
        let item = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: item)
        item.minimumLineSpacing = 0
        item.minimumInteritemSpacing = 0
        item.itemSize = CGSize(width:100, height: 100)
//        collection.delegate = self
        collection.dataSource = self
//        item.itemSize = CGSize(width: self.frame.size.width/4, height: self.frame.size.width/4)
        return collection
    }()
    
    var data:[UIImage] = [UIImage]()
    
   override init(frame: CGRect){
        super.init(frame: frame)
       
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
        collectionView.register(RSOneFiveCell.self, forCellWithReuseIdentifier: "123")
        collectionView.reloadData()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension RSMLSelectPhotosView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count == 8 ? 8 : data.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "123", for: indexPath) as! RSOneFiveCell
        if indexPath.row != data.count {
            cell.imageView?.image = data[indexPath.row]
        }else{
            cell.imageView?.image = UIImage(named: "")
        }
        cell.editimageView?.isHidden = indexPath.row == data.count ? true : false
        cell.imageView?.isUserInteractionEnabled = indexPath.row == data.count ? true : false
        cell.clickEditCellBlock = {
            self.data.remove(at: indexPath.row)
            collectionView.reloadData()
        }
        cell.clickImageViewCellBlock = {
            LXFLog(self.viewController)
//            TZImagePickerController *pickerController = [[TZImagePickerController alloc] initWithMaxImagesCount:8-self.dataArray.count columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
//                    pickerController.allowCrop = YES;
//                    [weakSelf.VC presentViewController:pickerController animated:YES completion:nil];
//                    [pickerController setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photo, NSArray * assets, BOOL isSelectOriginalPhoto) {
//                        [weakSelf.dataArray addObjectsFromArray:photo];
//                        NSLog(@"photo == %@, assets == %@",photo,assets);
//                        [weakSelf.collectionView reloadData];
//                    }];
        }
        return cell
    }
//    - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(kScreenWidth/4, kScreenWidth/4);
//}
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
    }
    
    
}
