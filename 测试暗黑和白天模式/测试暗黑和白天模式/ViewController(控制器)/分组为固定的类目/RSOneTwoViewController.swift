//
//  RSOneTwoViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/23.
//

import UIKit

class RSOneTwoViewController: RSBaseViewController {
    
    lazy var titleView:UIView = {
       let titleView = UIView()
//        titleView.backgroundColor = UIColor.orange
        return titleView
    }()
    
    lazy var contentScrollerView:UIScrollView = {
       let contentScrollerView = UIScrollView()
        contentScrollerView.backgroundColor = UIColor.red
        contentScrollerView.isPagingEnabled = true
        contentScrollerView.showsHorizontalScrollIndicator = false
        contentScrollerView.bounces = false
        contentScrollerView.delegate = self
        contentScrollerView.panGestureRecognizer.require(toFail: (self.navigationController?.interactivePopGestureRecognizer)!)
       return contentScrollerView
    }()

    
    var titleBtnArray:[UIButton] = [UIButton]()
    
    var preBtn:UIButton?
    
    var lineView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建导航栏的视图
        addTitleView()
        
        addContentScrollview()
        
        //创建导航栏分类的下划线
        addSubViewController()
        
        let btn = titleBtnArray[0]
        titleBtnClick(btn: btn)
    
//        if (self.title as NSString).isEqual(to: ""){
//        }

        
    }
    
    //添加标题view
    func addTitleView(){
        
        self.titleView.frame = CGRect(x: 0, y: 0, width: SCW/2, height: 38)
        
        addTitleBtn()
        
        addUnLineView()
        
        navigationItem.titleView = titleView
        
    }
    
    //添加下面contentScrollview
    func addContentScrollview(){
        self.contentScrollerView.frame = CGRect(x: 0, y: 0, width: SCW, height: SCH)
        view.addSubview(self.contentScrollerView)
    }
    
    
    //添加多个子控制器
    func addSubViewController(){
        let view1 = RSSevenViewController()
        view1.view.backgroundColor = UIColor.purple
        self.addChild(view1)
        let view2 = RSSevenViewController()
        view2.view.backgroundColor = UIColor.white
        self.addChild(view2)
        let view3 = RSSevenViewController()
        view3.view.backgroundColor = UIColor.gray
        self.addChild(view3)
        let count = self.children.count
        print(count)
        contentScrollerView.contentSize = CGSize(width:count * Int(contentScrollerView.width) , height: 0)
    }
    
    //添加标题view里面的按键
    func addTitleBtn(){
        let titles = ["首页","荒料","大板"]
        let btnW = Int(SCW)/2/titles.count
        let btnH = titleView.height
        for i in 0..<titles.count {
            let titleBtn = UIButton()
            titleBtn.tag = i
            titleBtn.frame = CGRect(x: i * btnW, y: 0, width: btnW, height: Int(btnH))
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            titleBtn.setTitle(titles[i], for: .normal)
            titleBtn.setTitleColor(UIColor.colorWithDyColorChangObject(lightColor: "#666666"), for: .normal)
            titleBtn.setTitleColor(UIColor.colorWithDyColorChangObject(lightColor: "#666666"), for: .normal)
            titleView.addSubview(titleBtn)
            titleBtnArray.append(titleBtn)
            titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        }
    }
    
    //添加下划线
    func addUnLineView(){
        let titleBtn = self.titleBtnArray[0]
        lineView = UIView()
        lineView?.backgroundColor = UIColor.purple
        let lineViewH = 2
        let y = Int(titleView.height) - lineViewH - 4
//        lineView?.setYB_Height(height: CGFloat(lineViewH))
        lineView?.height = CGFloat(lineViewH)
//        lineView?.setYB_Y(Y: CGFloat(y))
        lineView?.y = CGFloat(y)
        titleBtn.titleLabel?.sizeToFit()
//        lineView?.setYB_Width(widht: CGFloat(30))
        lineView?.width = 30
//        lineView?.setYB_CenterX(center:titleBtn?.yB_CenterX() ?? 0)
        lineView?.centerX = titleBtn.centerX
        titleView.addSubview(lineView!)
        lineView?.layer.cornerRadius = 1
        lineView?.layer.masksToBounds = true
    }
    
    
    @objc func titleBtnClick(btn:UIButton){
        preBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        preBtn?.isSelected = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.isSelected = true
        preBtn = btn
        let tag = btn.tag
        UIView.animate(withDuration: 0.25) {
//            self.lineView?.setYB_Width(widht: (btn.titleLabel?.yB_Width())!)
            self.lineView?.width = btn.titleLabel!.width
//            self.lineView?.setYB_CenterX(center: btn.yB_CenterX())
            self.lineView?.centerX = btn.centerX
//            self.contentScrollerView.contentOffset = CGPoint(x: tag * Int(self.contentScrollerView.yB_Width()), y: 0)
            self.contentScrollerView.contentOffset = CGPoint(x: tag * Int(self.contentScrollerView.width), y: 0)
        }
        let vc = self.children[tag]
        if (vc.view.superview != nil){
            return
        }
        vc.view?.frame = contentScrollerView.bounds
        contentScrollerView.addSubview(vc.view)
    }
}


extension RSOneTwoViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.width
        let titleBtn = titleBtnArray[Int(index)]
        titleBtnClick(btn: titleBtn)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var ratio = Int(scrollView.contentOffset.x / scrollView.width)
        ratio -= preBtn!.tag
//        lineView?.setYB_CenterX(center: preBtn!.centerX + CGFloat(ratio) * preBtn?.centerX)
        lineView?.centerX = preBtn!.centerX
//        + CGFloat(ratio) * preBtn!.centerX
    }
                                
    
}
