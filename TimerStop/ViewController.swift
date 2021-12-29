//
//  ViewController.swift
//  TimerStop
//
//  Created by 江啟綸 on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var StartBtn: UIButton!
    @IBOutlet weak var PauseBtn: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    
    var counter:Float = 0.0{
        didSet{
            TimerLabel.text = String(format: "%.1f", counter)
        }
    }
    var timer: Timer? = Timer()
    var isStart = false
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        // 只读计算属性，可以去掉get和花括号
////        get {
////            return UIStatusBarStyle.lightContent
////        }
//        return UIStatusBarStyle.lightContent
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0.0
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isStart = false
        counter = 0
        StartBtn.isEnabled = true
        PauseBtn.isEnabled = true
        
    }
    
    @IBAction func StartBtn(_ sender: UIButton) {
        StartBtn.isEnabled = false
        PauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func PauseBtn(_ sender: UIButton) {
        StartBtn.isEnabled = true
        PauseBtn.isEnabled = false
        
        if let timerTemp = timer{
            timerTemp.invalidate()
        }
        timer = nil
        isStart = false
        
    }
    
    
    
    @objc func UpdateTimer() {
        counter += 0.1
    }
    
    


}

