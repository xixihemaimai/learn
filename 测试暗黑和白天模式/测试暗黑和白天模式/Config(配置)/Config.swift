//
//  Config.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/15.
//

import Foundation
import UIKit


// MARK:- 自定义打印方法
func LXFLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):(\(lineNum))-\(message)")
    #endif
}

//全局的背景颜色，适配暗黑模式
let allBackgroundColor = UIColor.colorWithDyColorChangObject(lightColor: "#fffffff", darkColor: "#333333", alpha: 1.0)


//配置各个屏幕的
//iphone4
let IS_IPHONE4 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone5
let IS_IPHONE5 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone6
let IS_IPHONE6 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone6 plus
let IS_IPHONE6_PLUS = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphoneX  iphoneXS iphone11pro
let IS_IPHONE_X = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone xr 和 11
let IS_IPHONE_XR = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphoneXS Max 和 11 proMax
let IS_IPHONEXSMAX = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone12_mini 和 iphone13_mini
let IS_IPHONE12_MINI = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1080, height: 2340).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone12 和 12pro 和 iphone13 iphone13 pro
let IS_IPHONE12 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1170, height: 2532).equalTo((UIScreen.main.currentMode?.size)!) : false)
//iphone12_promax 和 iphone13_promax
let IS_IPHONE12_PROMAX = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1284, height: 27878).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断是否是iphonex系列
let IPHONEX_ALL = IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONEXSMAX || IS_IPHONE12 || IS_IPHONE12_MINI || IS_IPHONE12_PROMAX
//状态栏高度 有 47 48 20 44区别
let Height_StatusBar = UIApplication.shared.statusBarFrame.size.height
//导航栏和状态的高度
let Height_NavBar = (IS_IPHONE_XR == true || IS_IPHONEXSMAX == true || IS_IPHONE12_MINI == true) ? 88.0 : ( IS_IPHONE_X == true ) ? 92.0 : ( IS_IPHONE12 == true  || IS_IPHONE12_PROMAX == true ) ? 91.0 : 64.0
//tabbar的高度
let Height_Tabbar = (IPHONEX_ALL == true) ? 83.0 : 49.0
//tabbar底部的高度
let Height_BottomSafeArea = (IPHONEX_ALL == true) ? 34.0 : 0.0


//网络请求的debug模式还是release模式 debug为1 release 2
//let baseURL = 1


//等比适配的设置
class BSFitdpiUtil{
    //+ (CGFloat)adaptWidthWithValue:(CGFloat)floatV;
    class func adaptWidthWithValue(floatV:CGFloat)->CGFloat{
        return floatV*(SCW / kRefereWidth)
    }
}

//以苹果6位基准进行适配
let kRefereWidth = 375.0 //参考宽度
let kRefereHight = 667.0 //参考高度的
//屏幕高度和宽度
let SCW = UIScreen.main.bounds.width
let SCH = UIScreen.main.bounds.height
//进行适配这个值
func scale(_ floatV:CGFloat)->CGFloat{
    BSFitdpiUtil.adaptWidthWithValue(floatV: floatV)
}
