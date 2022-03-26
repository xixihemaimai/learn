//
//  RSTwoOneViewController.swift
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/26.
//

import UIKit

class RSTwoOneViewController: UIViewController {

    
    //头部UIScrollview
    lazy var titleScrollView:UIScrollView = {
       let titleScrollview = UIScrollView()
        titleScrollview.showsHorizontalScrollIndicator = false
        titleScrollview.backgroundColor = UIColor.orange
        titleScrollview.delegate = self
        return titleScrollview
    }()
    
    //内容uiscrollview
    lazy var contentScrollView:UIScrollView = {
       let contentScrollView = UIScrollView()
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.backgroundColor = UIColor.yellow
        contentScrollView.delegate = self
        contentScrollView.isPagingEnabled = true
        contentScrollView.bounces = true
        return contentScrollView
    }()
    
    var titleView:UIView!
    
    var perBtn:UIButton?
    
    var btnArray:[UIButton] = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //创建头部的uiscrollview
        addTitleScrollview()
        //创建内容的UISrollview
        addContentScrollview()
        //创建头部的uiscrollview的标题按键
        addTitleArrayBtn()
        //创建头部uiscrollview的标题按键的下划线
        adddUnlineView()
        //创建内容的添加的子控制
        addChildViewController()
        //创建UIScrollview的代理
        
        
        //执行第一个
        let btn = btnArray[0]
        showTitleAction(btn: btn)
        
        
        
    }
    
    //创建头部的UIScrollview
    func addTitleScrollview(){
        view.addSubview(titleScrollView)
        titleScrollView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    //创建内容的UIScrollview
    func addContentScrollview(){
        view.addSubview(contentScrollView)
        contentScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleScrollView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    
    //创建头部的标题按键
    func addTitleArrayBtn(){
        let titleArray = ["推荐","鞋类","潮服","手表","箱包","配饰","美妆","潮王","手办","数码","热销","发售","手机"]
        let titleWith = 80
        for i in 0..<titleArray.count {
            let btn = UIButton(type: .custom)
            btn.tag = i
            btn.setTitle(titleArray[i], for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitleColor(UIColor.green, for: .selected)
            btn.addTarget(self, action: #selector(showTitleAction), for: .touchUpInside)
            btn.frame = CGRect(x: i * titleWith, y: 0, width: titleWith, height: 50)
            titleScrollView.addSubview(btn)
            btnArray.append(btn)
        }
        titleScrollView.contentSize = CGSize(width: titleArray.count * titleWith, height: 0)
    }
    
    //这边是点击标题的方法
    @objc func showTitleAction(btn:UIButton){
        //这边是要改变下划线的位置，和颜色，字体的变化
//        perBtn.font = UIFont.systemFont(ofSize: 14)
        perBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        perBtn?.isSelected = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.isSelected = true
        perBtn = btn
        
        
        //让标题按钮居中
        var offsetX = btn.center.x - SCW * 0.5
        if offsetX < 0 {
            offsetX = 0
        }
        //计算最大偏移量
        let maxOffsetX = titleScrollView.contentSize.width - SCW
        if offsetX > maxOffsetX{
            offsetX = maxOffsetX
        }
        titleScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
        
        //下滑线的变化
        UIView.animate(withDuration: 0.25) {
            self.titleView.centerX = btn.centerX
            self.titleView.y = btn.bottom - 2
            self.contentScrollView.contentOffset = CGPoint(x: btn.tag * Int(self.contentScrollView.width), y: 0)
        }
       //添加控制器
        let vc = self.children[btn.tag]
        if (vc.view.superview != nil){
            return
        }
        vc.view?.frame = contentScrollView.bounds
        contentScrollView.addSubview(vc.view)
    }
    
    
    //添加下划线
    func adddUnlineView(){
        titleView = UIView()
        let btn = btnArray[0]
        //这边要先获取按键的第一个center.x
        titleView.y = btn.bottom - 2
        titleView.width = 40
        titleView.backgroundColor = UIColor.blue
        titleView.height = 2
        titleView.centerX = btn.centerX
        titleScrollView.addSubview(titleView)
    }
    
    
    //添加子控制器
    func addChildViewController(){
        for i in 0..<13 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.init(CGFloat(i+13), CGFloat(i+15),CGFloat(i+16))
            self.addChild(vc)
            title = String(i)
        }
        let count = self.children.count
        contentScrollView.contentSize = CGSize(width: count * Int(view.bounds.size.width), height: 0)
    }
}

extension RSTwoOneViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let ratio = Int(scrollView.contentOffset.x / scrollView.width)
//        let btn = btnArray[ratio]
//        titleView.centerX = btn.centerX
        
        
        //这边是对渐变的处理
        
        //获取到左边的按钮和右边的按钮
        //计算出这俩个按钮的缩放比例
        
        //首先获取左边的标题按钮
//        let leftIndex = Int(scrollView.contentOffset.x / scrollView.width)
//        let rightIndex = leftIndex + 1
//        let leftBtn = btnArray[leftIndex]
//        var rightBtn = UIButton()
//        if rightIndex < btnArray.count{
//            rightBtn = btnArray[rightIndex]
//        }
//        var rightRatio = Int(scrollView.contentOffset.x / scrollView.width)
//        rightRatio -= leftIndex
        
//        let leftRatio = 1 - rightRatio
        
//        leftBtn.transform = CGAffineTransform(scaleX:  1 + 0.3 * CGFloat(leftRatio), y: 1 + 0.3 * CGFloat(leftRatio))
//        rightBtn.transform = CGAffineTransform(scaleX: 1 + 0.3 * CGFloat(rightRatio), y: 1 + 0.3 * CGFloat(rightRatio))

        /*
         文字颜色的渐变
         颜色的三通道 r g b:红色通道，绿色通道，蓝色通道(24真彩色)
         每个颜色通道8位二进制来标题 -> 十进制(0-255)256种
         在oc中的取值(0~1)
         常见颜色表示
         r g b
         0 0 0 （黑色）
         1 1 1 （白色）
         1 0 0  (红色)
         0 1 0 （绿色）
         0 0 1 （蓝色）
         */
//        leftBtn.setTitleColor(UIColor.init(CGFloat(leftRatio), 0, 0), for: .normal)
//        rightBtn.setTitleColor(UIColor.init(CGFloat(rightRatio), 0, 0), for: .normal)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let ratio = Int(scrollView.contentOffset.x / scrollView.width)
        LXFLog("-----323232---------\(ratio)")
        let btn = btnArray[ratio]
        showTitleAction(btn: btn)
    }
    
}
