//
//  ViewController.swift
//  StretchZoomImageView
//
//  Created by suhc on 16/3/7.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageViewHeight = UIScreen.mainScreen().bounds.width * 400 / 640
    
    private let zoomImageView = UIImageView(image: UIImage(named: "car"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        scrollView.backgroundColor = UIColor.redColor()
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height + scrollView.frame.size.width * 400 / 640)
        
        zoomImageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: imageViewHeight)
        scrollView.addSubview(zoomImageView)
        zoomImageView.contentMode = .ScaleAspectFill
    }

}

extension ViewController:UIScrollViewDelegate{
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y < 0{
            zoomImageView.frame.origin.y = y
            zoomImageView.frame.size.height = imageViewHeight - y
        }
    }
}
