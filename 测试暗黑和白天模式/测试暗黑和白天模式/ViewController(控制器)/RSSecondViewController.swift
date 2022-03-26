//
//  RSSecondViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/16.
//

import UIKit
import FMDB


@objc protocol RSSecondViewControllerDelegate: NSObjectProtocol{
    
    func addto()
    @objc optional func remove()
}


protocol sameDelegate{
    func twoo()
}


fileprivate enum type{
    case post
    case get
    
    func add(){
        print(1)
    }
    
}


fileprivate struct typss{
    var num:Int
    var num1:Int
    var num2:Int = 3
    
    mutating func add(){
        num2 = 4
    }
//    init(num:Int) {
//        self.num = num
//    }
}

class RSSecondViewController: RSBaseViewController {
    
    
    weak var delegate:RSSecondViewControllerDelegate?
    
    typealias Block = (_ num:Int) -> Int
    
    fileprivate var db:FMDatabase!
    fileprivate var secondView:RSSecondViewModel!
    fileprivate var nwe:Int = 0
    var two1:((_ num:Int)-> Int)!
    var two2:Block!
//    var types:type!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "数据库"
        view.backgroundColor = UIColor.purple
        
        
        //先看路径有没有
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let newPath = path.appendingPathComponent("")
        
        self.db = FMDatabase.init(path:newPath)
//        self.db .open()
        self.db.rollback()
//        self.db.beginTransaction()
//        self.db.executeUpdate(<#T##sql: String##String#>, values: <#T##[Any]?#>)
//        self.db.executeQuery(<#T##sql: String##String#>, values: <#T##[Any]?#>)
//        self.db.commit()
//        self.db.hadError()
//        self.db.close()
        
        
        let type = type.post
        type.add()
        
        var typess = typss.init(num: 1, num1: 2)
        typess.add()
        
        
//        let o =  typss.init(num: 10)
//        o.add()
    }
    
    
    
    
    func openSQL(){
        
        
        //打开数据库
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let newPath = path.appendingPathComponent("newSQL.sqlite")
        
        
        
        
        
        
//        let db = FMDatabase databaseWithPath:path
        //创建表格
//        create table if not exists xxx(xxxid integer primary key autoincrement,id integer not null,'code' text);
        //插入
//        insert into xxx(xxxid,code) value(?,?);
        //全局查
//        select * from xxx
        //有判断的查询
//        select * from xxx where code='%@';
        //改
//        update xxx set code = '%@';
        //删除
//        delete from xxx;
        //有条件的删除
//        delete from xxx where id ="%d%%";
//        删除
//        delete from xxx
        //更新
        
        
        //创建
        //creat table if not exists xxx(id interger primary key autoincrement,id interger not null,'code' text);
        //插入
//        insert into xxx(id,code)value (?,?);
        //查询
//        select * from xxx
        //更新
//        update xxx set id =,code
        //删除
//        delete from xxx
        
        
        
    }
    

   fileprivate func stringTest(){
        
        
//        let test = "123"
//        let data = NSData()
//        let bundle = (Bundle.main.resourcePath as NSString).appendingPathComponent("")
        
      var name = ["2","12"]
      name = name.sorted { string1, string2 in
            string1.count > string2.count
        }
        
        let test = stringBlock(block: { num in
            return num
        }, test: 10)
        
     print(test)
        
       stringBlockTwo { num in
           return num
       }
        
      
        stringBlockThree { num in
            return num
        }
        
       
       stringBlockFour(num: 10) { num in
           return num
       }
       
     
       stringBlockFive(num: 10) { num2 in
           return num2
       }
       
    }
    
    
    
   fileprivate func stringBlock(block:(_ num:Int)->Int,test:Int) -> Int{
//        let num = 10
        return block(test)
    }
    
    
    fileprivate func stringBlockTwo(block:@escaping (_ num:Int) -> Int){
        
    }
    
    fileprivate func stringBlockThree(block:@escaping (_ num:Int) -> Int){
       print(block(10))
    }
    
    
    func stringBlockFour(num:Int,two:@escaping (_ num:Int) -> Int){
        print(num,two)
        self.two1 = two
    }
    
    
    func stringBlockFive(num:Int,two:@escaping (_ num2:Int)->Int){
        print(two(num))
    }
    
    
    func testpath(){
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let newpath = path.appendingPathComponent("newtespath.sqlite")
        let fileManager = FileManager.default
        if(!fileManager.fileExists(atPath: newpath)){
            let paths = (Bundle.main.resourcePath! as NSString).appendingPathComponent("nnn.sqlite")
            do
            {
                _ = try fileManager.copyItem(atPath: paths as String, toPath: newpath)
            }catch{}
        }
        db = FMDatabase.init(path: newpath)
        if db.open(){
            //创建表格-->创建表格失败---》创建表格成功的分支
        }else{
        }
    }
}


extension RSSecondViewController{
    var to:Int{
        return 10
    }
}
