//
//  RSThirdViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/17.
//

import UIKit

class RSThirdViewController: RSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        title = "多线程"
        
        let main = DispatchQueue.main //主队列
         let global = DispatchQueue.global() // 全局队列
          let queue = DispatchQueue(label: "test",attributes: .concurrent)
        let queue1 = DispatchQueue(label: "test1" ,attributes: .concurrent).async(execute: DispatchWorkItem(flags: .barrier, block: {
            DispatchQueue.main.async(execute: DispatchWorkItem(block: {
                     //更新ui
               
            }))
        }))
        
        
        let work = DispatchWorkItem {
            
        }
        
        let group1 = DispatchGroup()
        global.async(group: group1, execute: work)
        
        
        //延迟1秒
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
        }
        
      
        //队列名字在叫test 是并发
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.wait()
        group.leave()
        group.notify(queue: queue, work: DispatchWorkItem(block: {
        }))
    }
}
