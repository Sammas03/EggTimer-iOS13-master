//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":3,"Medium":4,"Hard":7]
    
    var secondsRemaining = 60.0
    
    var timer = Timer()

    var totalTime = 0.0
    
    var secondsPassed = 0.0
    
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBAction func buttom(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        secondsPassed = 0.0
        totalTime = Double(eggTimes[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            print(secondsPassed)
            secondsPassed += 0.01
            progressbar.progress = Float(secondsPassed) / Float(totalTime)
        }else if secondsRemaining == 0 {
            timer.invalidate()
            titleLabel.text = "done"
        }
    }
    
}
