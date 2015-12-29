//
//  TimerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 12/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var bTimer: UILabel!
    
    var timer = NSTimer()
    var count:NSTimeInterval = 120
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pause.hidden = true
        //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
    }
    
    //timer countdown
    func update() {
        if(count > 0){
            bTimer.text = timeString(count--)
            
        }else{
            timer.invalidate();
        }
        
    
    }
    
    //timer formating and string return
    func timeString(time:NSTimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        return String(format:"%02i:%02i",minutes,Int(seconds))
    }
    
    //play button action
    @IBAction func play(sender: AnyObject) {
        pause.hidden = false
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
