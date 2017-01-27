//
//  gameViewController.swift
//  ButtonMaster
//
//  Created by Ajay Singh on 1/10/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var buttonPresses = 0
    var timeVal = 20
    var scoreVal = 0
    var timer = Timer()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        let scoreDefault = UserDefaults.standard
        if(scoreDefault.value(forKey: "scoreVal") != nil){
        scoreVal = scoreDefault.value(forKey: "scoreVal") as! NSInteger
        score.text = String(scoreVal)
        }
        self.view.backgroundColor = UIColor.green
    }
    
    @IBAction func makeCount(_ sender: AnyObject) {
        if(buttonPresses == 0){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameViewController.updateTimer), userInfo: nil, repeats: true)
        }
        buttonPresses += 1
        counter.text = String(buttonPresses)
        if(scoreVal < buttonPresses){
            scoreVal = buttonPresses
            score.text = String(scoreVal)
        }
        let scoreDefault = UserDefaults.standard
        scoreDefault.setValue(scoreVal,forKey:"scoreVal")
        scoreDefault.synchronize()
    }
    
    @IBAction func resetCount(_ sender: AnyObject) {
        timer.invalidate()
        buttonPresses = 0
        timeVal = 20
        counter.text = String(buttonPresses)
        timeLabel.text = String(timeVal)
        self.view.backgroundColor = UIColor.green
    }
    
    func updateTimer(){
        timeVal -= 1
        timeLabel.text = String(timeVal)
        
        if(timeVal == 0){
            timer.invalidate()
            self.view.backgroundColor = UIColor.red
        }
    }
    
    

}
