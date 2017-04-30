//
//  ViewController.swift
//  EggTimer
//
//  Created by Chang Ming-hsuan on 29/04/2017.
//  Copyright © 2017 Chang Ming-hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var time = 210
    var timer = Timer()
    
    @IBAction func playButtonPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func minusTenButtonPressed(_ sender: Any) {
        if time > 10 {
            time -= 10
            timerLabel.text = String(time)
        }
    }
    
    @IBAction func plusTenButtonPressed(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
    }
    
    func decreaseTimer() {
        if time > 0 {
            time -= 1
            timerLabel.text = String(time)
        } else {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
