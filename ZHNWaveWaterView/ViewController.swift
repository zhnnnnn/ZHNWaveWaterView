//
//  ViewController.swift
//  ZHNWaveWaterView
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wave: ZHNwaveWaterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButton(sender: AnyObject) {
        
             self.wave.BecomePointY = 100
    }

    @IBAction func clickAddButton(sender: AnyObject) {
        self.wave.BecomePointY = 1
    }
}

