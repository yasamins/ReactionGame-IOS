//
//  ViewController.swift
//  Reaction
//
//  Created by yasamin  on 26.10.2016.
//  Copyright © 2016 yasamin. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var timerScore = Timer()
    
    //countdown the 3,2,1
    var countInt = 0
    var ScoreInt = 0
    
    @IBOutlet weak var GetReadyLabel: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    

    @IBOutlet weak var thanks: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        ScoreInt = 0
        TimerLabel.text = String(ScoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartStop(_ sender: AnyObject) {
        
        if ScoreInt == 0 {
            countInt = 3
            GetReadyLabel.text = String(countInt)
            TimerLabel.text = String(ScoreInt)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
            sender.setTitle("Start", for: UIControlState())

            
        } else {
            timerScore.invalidate()
        }
        
        if countInt == 0 {
            ScoreInt = 0
            
            sender.setTitle("Restart", for: UIControlState())
        }
    }
    
    
    func updateCounter()
    {
        
        countInt -= 1
        GetReadyLabel.text = String(countInt)
        
        if countInt == 0 {
            timer.invalidate()
            
            ScoreInt = 0
            TimerLabel.text = String(ScoreInt)
            
            
            timerScore = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
        }
       
    }
    
    func updateScoreTimer(){
        ScoreInt += 1
        TimerLabel.text = String(ScoreInt)
    }
    
    @IBAction func actions(_ sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: "Give us Feedback", message: "Didyou like the game?", preferredStyle: .actionSheet)
        
        let Action1 = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert : UIAlertAction) -> Void in
            self.thanks.text = "Thank you for the feedback"
            
        })
        
        
        let Action2 = UIAlertAction(title: "No", style: .default, handler: {
            (alert : UIAlertAction) -> Void in
            self.thanks.text = "Thank you for the feedback"

    })
        
        
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert : UIAlertAction) -> Void in
    
})
        //we need to add the buttons to our view

optionMenu.addAction(Action1)
optionMenu.addAction(Action2)
optionMenu.addAction(Cancel)
        
        // then we need to present it to the view

self.present(optionMenu, animated: true, completion: nil)

    }
}
