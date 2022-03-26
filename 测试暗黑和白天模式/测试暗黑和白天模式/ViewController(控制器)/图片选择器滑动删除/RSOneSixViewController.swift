//
//  RSOneSixViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

import UIKit

class RSOneSixViewController: RSBaseViewController {


    //保存长按手势开始的位置
    var startPoint:CGPoint = CGPoint(x: 0, y: 0)
    //保存长按手势原始的位置
    var originPoint:CGPoint = CGPoint(x: 0, y: 0)
     //创建一个放图片的UIview
    var imagesContentView:UIView = UIView()
     //创建一个选择相册的按键
    var selectImageBtn:UIButton = UIButton()
    //创建一个放图片的数组----并初始化
    var images:[Int] = [Int]()
    
    //底下的视图
    var bottomView:UIButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //添加放图片的view
        let imageW = (SCW - 50)/4
        imagesContentView.frame = CGRect(x: 0, y: 100, width: SCW, height: imageW + 20)
        imagesContentView.backgroundColor = UIColor.orange
        view.addSubview(imagesContentView)
        
        
        // 添加一个按键到imagesContentImage
        selectImageBtn.frame = CGRect(x: 10, y: 10, width: imageW, height: imageW)
        selectImageBtn.setTitle("1", for: .normal)
        selectImageBtn.backgroundColor = UIColor.yellow
        selectImageBtn.addTarget(self, action: #selector(selectPhontAction), for: .touchUpInside)
        imagesContentView.addSubview(selectImageBtn)
        
        
        bottomView.setTitle("拖动删除", for: .normal)
        bottomView.backgroundColor = UIColor.red
        bottomView.setTitleColor(UIColor.white, for: .normal)
        bottomView.frame = CGRect(x: 0, y: view.frame.size.height, width: SCW, height: 50)
        view.addSubview(bottomView)
        
    }
    
    
    @objc func selectPhontAction(){
        images.append(1)
        addAndRefreshPhotoImage()
        //这边要对数组进行添加一张图片，并对里面的构造进行变化
//        let selectPhoto = UIImagePickerController()
//        selectPhoto.delegate = self
//        selectPhoto.allowsEditing = true
//        selectPhoto.cameraDevice = .rear
//        selectPhoto.mediaTypes = ["kUTTypeMovie","kUTTypeImage"]
//        let alert = UIAlertController(title: "选择需要的方式", message: "", preferredStyle: .actionSheet)
//        let cameraAction = UIAlertAction(title: "从相机拍摄", style: .default) { UIAlertAction in
////            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
////            //设置照片来源
////                        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
////                        [self presentViewController:imagePicker animated:YES completion:nil];
////                    }
//            if UIImagePickerController.isSourceTypeAvailable(.camera){
//                selectPhoto.sourceType = .camera
//                self.present(selectPhoto, animated: true, completion: nil)
//            }
//        }
//        alert.addAction(cameraAction)
//
//        let photoAction = UIAlertAction(title: "从相册中", style: .default) { UIAlertAction in
////            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
////                  [self presentViewController:imagePicker animated:YES completion:nil];
//            selectPhoto.sourceType = .photoLibrary
//            self.present(selectPhoto, animated: true, completion: nil)
//        }
//        alert.addAction(photoAction)
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { UIAlertAction in
//        }
//        alert.addAction(cancelAction)
//        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func moveRemoveAction(long:UILongPressGestureRecognizer){
        guard let imageView = long.view as? UIImageView else{
            return
        }
        originPoint = imageView.center
        startPoint = CGPoint(x: 0, y: 0)
        if long.state == .began{
            startPoint = long.location(in: long.view)
            UIView.animate(withDuration: 0.25) {
                self.bottomView.frame = CGRect(x: 0, y: CGFloat(self.view.frame.size.height - 50), width: SCW, height: 50.0)
            }
        }
        if long.state == .changed{
            let newPoint = long.location(in: long.view)
            let deltaX = newPoint.x - startPoint.x
            let deltaY = newPoint.y - startPoint.y
            imageView.center = CGPoint(x: imageView.centerX + deltaX - CGFloat(imageView.width/2), y: imageView.centerY + deltaY - CGFloat(imageView.height/2))
            LXFLog("++++++++++++++\(imageView.centerY)")
            if imageView.centerY >= 410{
                bottomView.setTitle("松开删除", for: .normal)
            }else{
                bottomView.setTitle("拖动删除", for: .normal)
            }
        }else if long.state == .ended{
            //这里要判断是否在屏幕底部要是在底部就进行删除，重新获取图片选择器视图
            //这里要判断拖动的位置在那个位置要进行删除，并文字要变成 放入删除
            UIView.animate(withDuration: 0.25) {
                self.bottomView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: SCW, height: 50)
            }
            if imageView.centerY >= 410{
                self.images.remove(at: imageView.tag)
            }
            //重新刷新
            addAndRefreshPhotoImage()
        }
    }
    
    func addAndRefreshPhotoImage(){
        imagesContentView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        let imageW = (SCW - 50)/4
        for i in 0..<images.count {
           let imageView = UIImageView()
           imageView.isUserInteractionEnabled = true
           imageView.tag = i
           let row = i / 4
           let colom = i % 4
//           imageView.image = images[i]
            imageView.backgroundColor = UIColor.blue
           let x = CGFloat(colom * (Int(imageW) + 10) + 10)
           let y = CGFloat(row * (Int(imageW) + 10) + 10)
           imageView.frame = CGRect(x: x, y: y, width: imageW, height: imageW)
            let long = UILongPressGestureRecognizer(target: self, action: #selector(moveRemoveAction))
            imageView.addGestureRecognizer(long)
           imagesContentView.addSubview(imageView)
        }
        //这边要判断图片有多少张
        //最后是把selectImageBtn添加进去
        if images.count >= 4 {
            imagesContentView.height = 2 * imageW + 30
            if images.count != 8{
                self.selectImageBtn.isHidden = false
               //这边添加selectBtn
                let count = images.count - 4
                selectImageBtn.frame = CGRect(x: CGFloat(CGFloat(count) * imageW) + CGFloat(10 * count) + 10.0, y: 20 + imageW, width: imageW, height: imageW)
                imagesContentView.addSubview(selectImageBtn)
            }else{
                selectImageBtn.isHidden = true
            }
        }else{
            self.selectImageBtn.isHidden = false
            imagesContentView.height = imageW + 20
            let count = images.count
            selectImageBtn.frame = CGRect(x: CGFloat(CGFloat(count) * imageW) + CGFloat(10 * count) + 10.0, y: 10, width: imageW, height: imageW)
            imagesContentView.addSubview(selectImageBtn)
        }
    }
}

extension RSOneSixViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            fatalError("错误")
        }
//        let type = info.index(forKey: UIImagePickerController.InfoKey.mediaType)
//        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//           NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
        
        //添加到数组中并刷新
//        images.append(selectedImage)
//        addAndRefreshPhotoImage()
        picker.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
