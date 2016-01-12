//
//  TimerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 12/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class TimerViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var bTimer: UILabel!
    
    var timer = NSTimer()
    var count:NSTimeInterval = 120
    var array = NSMutableArray()   //Change your array type to NSMutableArray
    var arrayInt = 0
    @IBOutlet weak var anteLabel: UILabel!
    @IBOutlet weak var sBlindLabel: UILabel!
    @IBOutlet weak var bBlindLabel: UILabel!
    
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var blindsBtn: UIButton!
    @IBOutlet weak var rulesBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let pUserName = PFUser.currentUser()?["username"] as? String {
            userLabel.text = "Welcome" + " " + pUserName
        }
        bTimer.text = timeString(count)
        //sBlindLabel.text = "5"
        loadData1()
        
        
    }
    
    
    func loadData1() {
        
        self.array.removeAllObjects()
        
        let query = PFQuery(className: "BlindLevel")
        
        query.orderByAscending("Time")
        
        query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                //loop your objects array
                for object in objects!{
                    
                    let blindLevel = object as PFObject
                    //add your element into array
                    self.array.addObject(blindLevel)
                }
                let tempArray :NSArray = self.array.objectEnumerator().allObjects
                self.array = NSMutableArray(array: tempArray)
                print(self.array.count)
                
                let tempObject = self.array.objectAtIndex(self.arrayInt) as! PFObject
                let sBlindString = (tempObject.objectForKey("Small") as? String)!
                

                self.sBlindLabel.text = sBlindString
                self.bBlindLabel.text = tempObject.objectForKey("Big") as? String
                print(self.array)
                print(sBlindString)
            } else {
                
                //println( error?.userInfo )
            }
        }
        
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
    
    //previous button action
    @IBAction func prevBtn(sender: AnyObject) {
        
    }
    
    //play button action
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    //pause button action
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    //next button action
    @IBAction func nextBtn(sender: AnyObject) {
        
    }
    
    //blinds button action
    @IBAction func blindsBtn(sender: AnyObject) {
        
    }
    
    //rules button action
    @IBAction func rulesBtn(sender: AnyObject) {
        
    }
    
    //reset button action
    @IBAction func resetBtn(sender: AnyObject) {
        
    }
    
    //logout button action
    @IBAction func logoutBtn(sender: AnyObject) {
        PFUser.logOut()
        self.dismissViewControllerAnimated(true, completion: nil)
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
