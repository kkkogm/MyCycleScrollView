//
//  swiperViewController.swift
//  MyCycleScrollView
//
//  Created by xmm on 2018/10/24.
//  Copyright © 2018 JuMa. All rights reserved.
//

import UIKit
import FSPagerView
//import Kingfisher

class swiperViewController: UIViewController {
    
    private var pagerView:FSPagerView!
    private var pageControl:FSPageControl!
    private var bannerArr:[String] = ["rc_bg_main_payTotal","rc_bg_main_payTotal","rc_bg_main_payTotal","rc_bg_main_payTotal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        // Do any additional setup after loading the view.
    }
    
}
    extension swiperViewController{
        func initUI(){
            pagerView = FSPagerView(frame: CGRect.init(x:0, y: 64, width: UIScreen.main.bounds.width, height: 150))
            pagerView.dataSource = self
            pagerView.delegate = self
            pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            pagerView.backgroundColor=UIColor.red
            view.addSubview(pagerView)
            pagerView.automaticSlidingInterval = 3.0
            pagerView.isInfinite = true
            // Create a page control
            pageControl = FSPageControl()
            pageControl.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 30)
            pageControl.center = CGPoint.init(x:pagerView.center.x ,y:pagerView.frame.maxY+20)
            pageControl.numberOfPages = bannerArr.count
            pagerView.addSubview(pageControl)
            
            
        }
    }

extension swiperViewController:FSPagerViewDelegate,FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.bannerArr.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: bannerArr[index])
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int){
        //  self.pushToWebVC(urlLink: self.bannerArr[1][index], urlTitle: nil)
    }
}
