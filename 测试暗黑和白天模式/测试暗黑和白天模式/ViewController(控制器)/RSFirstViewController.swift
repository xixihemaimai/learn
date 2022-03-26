//
//  RSFirstViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/16.
//

import UIKit

class RSFirstViewController: RSBaseViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("++++++++++++++1+++++++++++++++++++++++++++++")
        view.backgroundColor = UIColor.orange
        
        //文件管理
        let fileManger = FileManager.default
        //创建目录
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].toNSString
        //拼接路径和文件名字
        let path = documentPath.appendingPathComponent("/gradre")
        //判断有没有文件
        if !fileManger.fileExists(atPath: path){
            //没有就创建文件
            fileManger.createFile(atPath: path, contents: nil, attributes: nil)
        }
        
        let newPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let topath = newPath.appendingPathComponent("/newgradre")
        //移动文件到另一个位置
        do{
            try fileManger.moveItem(atPath: path, toPath: topath)
        }catch{
        }
        
        let str = "123"
        do{
            try (str as NSString).write(toFile: topath, atomically: true, encoding: String.Encoding.utf8.rawValue)
        }catch{
            print("写入失败")
        }
        
        //path中获取数据
        if let path1 = Bundle.main.path(forResource: "newgrade.plist", ofType: nil){
            do{
                try String(contentsOfFile: path1)
            }catch{
            }
        }
        
        //删除文件
//        fileManger.removeItem(atPath: <#T##String#>)
        //复制文件
//        fileManger.copyItem(atPath: <#T##String#>, toPath: <#T##String#>)
        
        //数组写入路径中
//        let array = [Any]()
//        (array as NSArray).write(toFile: <#T##String#>, atomically: <#T##Bool#>)
        
        
        
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
        btn.frame = CGRect(x: 100, y: 100, width: scale(100), height: scale(100))
        view.addSubview(btn)
        
        
        let nn = "123"
    }
    
    @objc func jump(btn:UIButton){
        let secondVc = RSSecondViewController()
         _ = secondVc.two1(10)
        secondVc.delegate = self

        _ = secondVc.two2(10)
        
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("+++++++++++3++++++++++++++++++++++++++++++++")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("++++++++++2+++++++++++++++++++++++++++++++++")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("++++++++++4+++++++++++++++++++++++++++++++++")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("++++++++++5+++++++++++++++++++++++++++++++++")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("+++++++++++6++++++++++++++++++++++++++++++++")
    }
    
    

    override func eat() {
        print("+++++++++++++++++++++吃饭中")
    }
}





extension RSFirstViewController:RSSecondViewControllerDelegate{
   
    
    func addto() {
        print("1")
    }
    
    
//    func remove() {
//        print(2)
//    }
}
