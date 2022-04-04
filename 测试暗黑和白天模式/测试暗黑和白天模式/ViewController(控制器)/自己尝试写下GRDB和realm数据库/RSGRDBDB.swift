//
//  RSGRDBDB.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/3.
//

import UIKit
import GRDB
import sqlcipher


class RSGRDBDB: NSObject {

    //路径
    var dapath = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as NSString).appendingPathComponent("GRDB")
    
    
    var stringPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! + "grdb"
    
    //创建 dataBaseQueue
    var queue:DatabaseQueue?
//    static let share = RSGRDBDB()
    
    
    private static var config:Configuration = {
        //配置
       var configuration = Configuration()
        //设置超时
        configuration.busyMode = Database.BusyMode.timeout(5.0)
        //试图访问锁着的数据
//        configuration.busyMode = Database.BusyMode.immediateError
        
    }()
    
    
    override init(){
        super.init()
//        self.queue = try! DatabaseQueue(path: dapath)
        self.queue = try! DatabaseQueue(path: dapath, configuration: RSGRDBDB.config)
    }
}



struct chatCroupDBModel:Codable{
    var id:Int64
    var ground:Int64
    //创建文件名
    static var tableName:String = "ddd"
    
//   private enum Comluns:String,CodingKey,ColumnExpression{
//        case id = "id"
//        case ground = "gound"
//    }
}


extension chatCroupDBModel:MutablePersistableRecord,FetchableRecord{
    static var queue:DatabaseQueue = RSGRDBDB().queue!
    //创建
    static func creat(quue:DatabaseQueue){
        self.queue = quue
        try? self.queue.inDatabase({ Db in
            try Db.create(table: chatCroupDBModel.tableName, body: { td in
                td.column("id", .integer)
                td.column("ground", .integer)
            })
        })
    }
    
    //插入
    static func insert(model:chatCroupDBModel){
        //这边还是可以添加一些条件
        guard chatCroupDBModel.query(id: model.id) == nil else{
            //更新
          self.update(model: model)
          return
        }
        try? self.queue.inTransaction{ (db) -> Database.TransactionCompletion in
            do{
                var model1 = model
                try model1.insert(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    //查询
    static func query(id:Int64) -> chatCroupDBModel?{
        return try! self.queue.unsafeRead({ (db) -> chatCroupDBModel? in
            return try chatCroupDBModel.filter(Column("id") == id).fetchOne(db)
        })
    }
    
    
    //查询所有
    static func quertAll() -> [chatCroupDBModel]{
        return try! self.queue.unsafeRead { (db) -> [chatCroupDBModel] in
            return try chatCroupDBModel.fetchAll(db)
        }
    }
    
    
    
    //改(更新)
    static func update(model:chatCroupDBModel){
        try? self.queue.inTransaction{ (db) -> Database.TransactionCompletion in
            do{
                try model.update(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    
    
    
    ////根据某些条件删除
    static func delete(id:Int64){
        guard let model = self.query(id: id) else
        {
            return
        }
        self.delete(model: model)
    }
    
    //删除
    static func delete(model:chatCroupDBModel){
        try? self.queue.inTransaction{ (db) -> Database.TransactionCompletion in
            do{
                try model.delete(db)
                return Database.TransactionCompletion.commit
            }catch{
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    
    
    
    
    
    
}


