//
//  RSThreeZeroViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/4/3.
//

import UIKit
import sqlcipher

class RSThreeZeroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        guard let model = try? JSONDecoder().decode(threeZorn.self, from: Data()) else{
            return
        }
        
        guard let model = try? JSONDecoder().decode(Animai.self, from: Data()) else{
            return
        }
        
    }
}

struct threeZorn:Codable{
    var a:Int
    var b:Bool
    var c:String
    
    
    enum CodingKeys:String,CodingKey{
        case a
        case b
        case c
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        a = try container.decode(Int.self, forKey: .a)
        b = try container.decode(Bool.self, forKey: .b)
        c = try container.decode(String.self, forKey: .c)
    }
    
}



struct Animai:Codable{
    var sex:String
    var age:Int
    var briday:String
    var run:String
    
    
    enum CodingKeys:String,CodingKey{
        case sex = "sex"
        case age = "age"
        case briday = "briday"
        case run = "run"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sex = try container.decode(String.self, forKey: .sex)
        age = try container.decode(Int.self, forKey: .age)
        briday = try container.decode(String.self, forKey: .briday)
        run = try container.decode(String.self, forKey: .run)
    }
    
}
