//
//  UserManager.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/31.
//

import Foundation
import UIKit


class userManager:NSObject{
    
    static let share = userManager()
    
    var usermodel:RSUserModel?
    override init(){
        super.init()
        //这边要获取用户数据来判断有没有值
        
//        let usermodel = RSUserModel()
        
//        RSTwoSixNSObject.share.create(fileName: "userInfo", model: RSUserModel.Type)
//        guard let usermodel = RSTwoSixNSObject.share.querySingleObjectFromDb(propertys: RSUserModel.Properties.all, fromTable: "userInfo") else{
//            return
//        }
        guard let _usermodel:RSUserModel = RSTwoSixNSObject.share.querySingleObjectFromDb(propertys: RSUserModel.Properties.all, fromTable: "userInfo") else {
            return
        }
        usermodel = _usermodel
    }
    
    
    //判断是否登录
    func isLogin()->Bool{
        //这边要判断数据库里面是否有数据
     guard let _:RSUserModel = RSTwoSixNSObject.share.querySingleObjectFromDb(propertys: RSUserModel.Properties.all, fromTable: "userInfo") else {
        return false
      }
      return true
    }
    
    
    
//    判读用户的token --- 通过数据库获取用户信息的token --- getobject
    
    
    
    
//    用来更新token----通过数据库来更新用户信息的token -- update
    
    
    
    
    //用来更新用户信息 --- 这边需要去获取数据库 --- update
    func updateUserModel(userModel:RSUserModel){
        RSTwoSixNSObject.share.update(intoTable: "userInfo", on: RSUserModel.Properties.all, with: userModel)
        //这边对自己的usermodel进行更新
        self.usermodel = userModel
    }
    
    
    //获取用户信息
    func reloadUserModelInfo()->RSUserModel{
        guard let _userModel:RSUserModel = RSTwoSixNSObject.share.querySingleObjectFromDb(propertys: RSUserModel.Properties.all, fromTable: "userInfo") else{
//            return
            fatalError("获取失败")
        }
        self.usermodel = _userModel
        return _userModel
    }
    
    //_ otherVc:UIViewController -> ()
    //这边判断有没有登录
    func isLoginPresentVc(currentVc:UIViewController,presentVc:((_ otherVc:UIViewController) -> ())){
        if !isLogin(){
            //这边是弹起登录的部分
           let navi =  RSNaviViewController(rootViewController: UIViewController())
           currentVc.present(navi, animated: true, completion: nil)
        }else{
            //这边是已经登录的
            presentVc(currentVc)
        }
    }
    
}
