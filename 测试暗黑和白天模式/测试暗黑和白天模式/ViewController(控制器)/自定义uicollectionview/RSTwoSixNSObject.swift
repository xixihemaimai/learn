//
//  RSTwoSixNSObject.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import Foundation
import WCDBSwift

//enum tableName:String{
//    case userInfo = "userInfo"
//}

class RSTwoSixNSObject:NSObject{
    
    static let share = RSTwoSixNSObject()
    //路径
    var dathPath = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as NSString).appendingPathComponent("WCDB")
   
//    static let defaultDatabase: Database = {
//           return Database.init(withFileURL: URL.init(fileURLWithPath: dathPath))
//    }()
    
    //创建db
    var dataBase: Database?
    override init(){
        super.init()
        dataBase = createDb()
    }
    
    /// 创建db
    private func createDb() -> Database {
        print("wcdb数据库路径==\(dathPath)")
        return Database(withFileURL: URL.init(fileURLWithPath: dathPath))
    }

    
    //创建表
    func create<T:TableDecodable>(fileName:String,model:T.Type){
        do{
//            try database.create(table:fileName, of: model)
            try dataBase?.create(table: fileName, of: model)
        }catch{
            fatalError("创建失败")
        }
    }
    
    
    //增 insert数组
    func insert<T:TableEncodable>(object:[T],on propertys:[PropertyConvertible]? = nil,intoTable table:String){
        do{
            try dataBase?.run(transaction: {
                try dataBase?.insert(objects: object, on: propertys, intoTable: table)
            })
        }catch{
            fatalError("插入失败")
        }
    }
    
    //插入
    func insertOrReplaceTodb<T:TableEncodable>(object:T,table:String,on properts:[PropertyConvertible]? = nil){
        do{
            try dataBase?.run(transaction: {
                try dataBase?.insertOrReplace(objects: object, on: properts, intoTable: table)
            })
        }catch{
            fatalError("插入失败")
        }
    }
    
    
    //删 delete
    func delete(intoTable table:String,where condition:Condition? = nil,orderBy orderList:[OrderBy]? = nil,limit:Limit? = nil,offset:Offset? = nil){
        do{
            //fromTable table: String, // 表名
//            where condition: Condition? = nil, // 符合删除的条件
//            orderBy orderList: [OrderBy]? = nil, // 排序的方式
//            limit: Limit? = nil, // 删除的个数
//            offset: Offset? = nil
            try dataBase?.delete(fromTable: table, where: condition, orderBy: orderList, limit: limit, offset: offset)
        }catch{
            fatalError()
        }
    }
    
    //删除所以
    func deleteAll(){
        do{
            try dataBase?.close(onClosed: {
                try dataBase?.removeFiles()
            })
        }catch{
            fatalError("删除所以失败")
        }
    }
    
    
    
    //改 update
    func update<T:TableEncodable>(intoTable table:String,on propertys:[PropertyConvertible],with object:T,where condition:Condition? = nil,orderBy orderList:[OrderBy]? = nil,limit:Limit? = nil,offset:Offset? = nil){
        do{
            /**
             table: String,
                 on propertyConvertibleList: [PropertyConvertible],
                 with object: Object,
                 where condition: Condition? = nil,
                 orderBy orderList: [OrderBy]? = nil,
                 limit: Limit? = nil,
                 offset: Offset? = nil
             */
            try dataBase?.update(table: table, on: propertys, with: object, where: condition, orderBy: orderList, limit: limit, offset: offset )
        }catch{
            fatalError("修改失败")
        }
    }
    
    //查 quert
    func quert<T:TableDecodable>(fromTable: String,where condition: Condition? = nil, orderBy orderList:[OrderBy]? = nil,propertys:[PropertyConvertible],limit:Limit? = nil,offset:Offset? = nil) -> [T]?{
        do{
            guard let array:[T] = try (dataBase?.getObjects(on: propertys, fromTable: fromTable, where: condition, orderBy: orderList, limit: limit, offset: offset))else
            {
                fatalError("查询失败")
            }
            return array
        }catch{
            fatalError("查询失败")
        }
    }
    
    //查询单条
    func querySingleObjectFromDb<T:TableDecodable>(propertys:[PropertyConvertible],fromTable: String,where condition: Condition? = nil, orderBy orderList:[OrderBy]? = nil,offset:Offset? = nil)->T?{
        do{
            let object:T? = try dataBase?.getObject(on: propertys, fromTable: fromTable, where: condition, orderBy: orderList, offset: offset)
            return object
        }catch{
            fatalError("查询失败")
        }
    }
    
    
    
}
