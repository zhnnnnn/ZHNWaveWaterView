//
//  ZHNwaveWaterView.swift
//  ZHNWaveWaterView
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class ZHNwaveWaterView: UIView {

    var BecomePointY:CGFloat?
    var offsetX:CGFloat?
    var waveViewWeigth:CGFloat?
    var backWaveLayer:CAShapeLayer?
    var currentPointY:CGFloat?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化layer
        self.setUpWaveLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 初始化layer
        self.setUpWaveLayer()
        self.setUpDisplayLink()
    }
    
    override func layoutSubviews() {
        currentPointY = 0
        waveViewWeigth = self.bounds.size.width
        offsetX = 0
    }
    // 初始化
    func setUpWaveLayer(){
        
        let waveLayer = CAShapeLayer()
        waveLayer.fillColor = UIColor.blackColor().CGColor
        self.layer.addSublayer(waveLayer)
        backWaveLayer = waveLayer
    }
    
    func setUpDisplayLink(){
        
        let disPlaylink = CADisplayLink(target: self, selector: Selector("getWavePath"))
        disPlaylink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode:NSRunLoopCommonModes)
    }
    
    func getWavePath(){
        
        offsetX = offsetX! + 0.1
        
        if(BecomePointY > currentPointY && BecomePointY != currentPointY && BecomePointY != nil){
            currentPointY = (BecomePointY! - currentPointY!) / BecomePointY! + currentPointY!
        }else if(BecomePointY < currentPointY && BecomePointY != currentPointY && BecomePointY != nil){
            currentPointY = currentPointY! - (currentPointY! - BecomePointY!) / currentPointY!
        }
        
        
        let cgWavePath:CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(cgWavePath, nil, 0, currentPointY!)
       
        for var i:CGFloat = 0.0;i <= waveViewWeigth; i++ {
            // Asin（ωx+φ）+h
           let tempY = 10 * sin(0.02 * i + offsetX!) + currentPointY!
            CGPathAddLineToPoint(cgWavePath, nil, i, tempY)
        }
        
        CGPathAddLineToPoint(cgWavePath, nil, waveViewWeigth!, self.bounds.size.height)
        CGPathAddLineToPoint(cgWavePath, nil, 0, self.bounds.size.height)
        CGPathCloseSubpath(cgWavePath)
        
        backWaveLayer?.path = cgWavePath
    }
    
}
