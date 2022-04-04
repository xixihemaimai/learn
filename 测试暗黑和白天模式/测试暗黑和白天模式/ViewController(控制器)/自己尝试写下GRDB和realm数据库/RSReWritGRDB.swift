//
//  RSReWritGRDB.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/4.
//

import UIKit
import GRDB


//创建一个路径和queue

class RSReWritGRDB: NSObject {
 
    var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! + "db"
    
     var queue:DatabaseQueue?
    
    static var tableName = "db"
    
    static var config:Configuration = {
       var config = Configuration()
        config.busyMode = .timeout(5.0)
        return config
    }()
    
    override init(){
        super.init()
        queue = try! DatabaseQueue(path: path, configuration: RSReWritGRDB.config)
    }
}



struct ReWird:Codable{
    var id:Int64
    var age:Int
    var sex:String
    
}


extension ReWird:MutablePersistableRecord,FetchableRecord{

    static var queue:DatabaseQueue = RSReWritGRDB().queue!
    
    //创建
    static func creat(){
        try? queue.inDatabase({ db in
           return try db.create(table: RSReWritGRDB.tableName, body: { td in
                td.column("id",.integer)
                td.column("age",.integer)
                td.column("sex", .text)
            })
        })
    }
    
    
    
    //插入
    static func insert(model:ReWird){
        guard ReWird.query(id: model.id) == nil else{
            self.update(model: model)
            return
        }
        try? queue.inTransaction{ db -> Database.TransactionCompletion in
            do{
                var model1 = model
                try model1.insert(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    
    
    //更新
    static func update(model:ReWird){
        try? queue.inTransaction{ (db) -> Database.TransactionCompletion in
            do{
                try model.update(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    
    
    //获取 -- 单条
    static func query(id:Int64) -> ReWird?{
       return try? queue.unsafeRead({ db in
           return try ReWird.filter(Column("id") == id).fetchOne(db) ?? nil
       })
    }
    
    
    //获取 -- 多条
    static func queryAll(id:Int64) -> [ReWird]?{
        return try? queue.unsafeRead({ (db) in
            return try ReWird.filter(Column("id") == id).fetchAll(db)
        })
    }
    
    
    //删除
    static func deleteAll(model:ReWird){
        try? queue.inTransaction{ (db) -> Database.TransactionCompletion in
            do{
                try model.delete(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    //根据删除
    static func deleteSinger(model:ReWird){
        guard let model = ReWird.query(id: model.id) else {
            return
        }
        ReWird.deleteAll(model: model)
    }
    
}



