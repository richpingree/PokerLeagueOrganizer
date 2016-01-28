//
//  TimerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 12/28/15.
//  Copyright © 2015 Parse. All rights reserved.
//


import UIKit
import Parse
import AVFoundation

class TimerViewController: UIViewController {

    var timer = NSTimer()
    var count = 1500.0
    var array = NSMutableArray()   //Change your array type to NSMutableArray
    var arrayInt = 0

    var alarm:AVAudioPlayer!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var bTimer: UILabel!
    
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
        loadData1()
        
        let pUserName = PFUser.currentUser()?["username"] as? String
            userLabel.text = "Welcome" + " " + pUserName!
        
        
        
        
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        prevBtn.enabled = false
        if (play.enabled.boolValue == true && pause.enabled.boolValue == true){
            loadData1()
        }

        
        let pUserName = PFUser.currentUser()?["username"] as? String
            userLabel.text = "Welcome" + " " + pUserName!
        
        
    }
    
    func playSound(){
        let path = NSBundle.mainBundle().pathForResource("alarm.mp3", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            alarm = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }

    }
    func loadData1() {
        
        self.array.removeAllObjects()
        
        let query = PFQuery(className: "BlindLevel")
        
        query.orderByAscending("createdAt")
        
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
                //print(self.array.count)
                
                let tempObject = self.array.objectAtIndex(self.arrayInt) as! PFObject
                
                let minutes = (tempObject.objectForKey("Time")as! NSString).doubleValue
                self.count = 60 * minutes
                
                self.bTimer.text = self.timeString(self.count)
                self.anteLabel.text = tempObject.objectForKey("Ante") as? String
                self.sBlindLabel.text = tempObject.objectForKey("Small") as? String
                self.bBlindLabel.text = tempObject.objectForKey("Big") as? String
                
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
            //timer.invalidate();
            playSound()
            self.arrayInt++
            loadData1()
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
        if arrayInt  == 0 {
            prevBtn.enabled = false
        }else{
        
            self.arrayInt--
            loadData1()
        }
        
    }
    
    //play button action
    @IBAction func play(sender: AnyObject) {
        pause.enabled = true
        play.enabled = false
        //loadData1()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    //pause button action
    @IBAction func pause(sender: AnyObject) {
        play.enabled = true
        pause.enabled = false
        timer.invalidate()
    }
    
    //next button action
    @IBAction func nextBtn(sender: AnyObject) {
        prevBtn.enabled = true
        playSound()
        self.arrayInt++
        loadData1()
    }
    
    //blinds button action
    @IBAction func blindsBtn(sender: AnyObject) {
        
    }
    
    //rules button action
    @IBAction func rulesBtn(sender: AnyObject) {
        
    }
    
    //reset button action
    @IBAction func resetBtn(sender: AnyObject) {
        arrayInt = 0
        play.enabled = true
        pause.enabled = false
        timer.invalidate()
        loadData1()
    }
    
    //logout button action
    @IBAction func logoutBtn(sender: AnyObject) {
        timer.invalidate()
        PFUser.logOut()
        //self.dismissViewControllerAnimated(true, completion: nil)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") 
            self.presentViewController(viewController, animated: true, completion: nil)
        })
        
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
