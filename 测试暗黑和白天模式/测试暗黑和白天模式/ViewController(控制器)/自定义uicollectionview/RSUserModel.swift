//
//  RSUserModel.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import Foundation
import WCDBSwift

class RSUserModel:TableCodable{
    
    var name:String? = nil
    var token:String? = nil
    
    enum CodingKeys:String,CodingTableKey{
        typealias Root = RSUserModel
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        case name
        case token
    }
    
    
    
}
