//
//  RSRealmDB.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/3.
//

import UIKit
import Realm
import RealmSwift

class RSRealmDB: NSObject {

    static let share = RSRealmDB()
    
    let path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)).first! as NSString).appendingPathComponent("db")
    //创建DB
    
   //创建数据库
    func create() -> Realm{
        guard let realm = try? Realm() else{
            fatalError("创建失败")
        }
        return realm
    }
    
    
    //增
    func add(custom:customType){
        guard let realm = try? Realm() else{
//            fatalError("增加失败")
            return
        }
        //如果没有这个custom就创建一个
        try! realm.write({
            realm.add(custom)
        })
    }
    
    //删---全部
    func delete(){
        guard let realm = try? Realm() else{
//            fatalError("删除失败")
            return
        }
        try! realm.write({
            realm.deleteAll()
        })
    }
    
    
    //改
    func update(custom:customType){
        guard let realm = try? Realm() else{
//           fatalError("修改失败")
            return
        }
        var custom:customType
        if let _custom = realm.objects(customType.self).first{
            custom = _custom
        }else{
            custom = customType()
        }
        try! realm.write({
            custom.age = 10
        })
        
    }
    
    //查
    func quert(custom:customType,filer:String){
        guard let realm = try? Realm() else {
//            fatalError("查找失败")
            return
        }
        try! realm.write({
            realm.objects(customType.self).filter(filer)
        })
    }
    
}


class customType:Object{
    
    dynamic var sex:String = ""
    dynamic var age:Int = 0
    dynamic var briday:String = ""
    dynamic var run:String = ""
    
}
