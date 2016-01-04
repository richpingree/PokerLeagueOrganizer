//
//  BlindsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 12/29/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit


class BlindsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var anteInput: UITextField!
    @IBOutlet weak var smallInput: UITextField!
    @IBOutlet weak var bigInput: UITextField!
    @IBOutlet weak var breakSwitch: UISwitch!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var blindsTable: UITableView!
    
    var blindArray = [blindClass]()
    
    var items: [String] = ["Blind1", "Blind2", "Blind3"]
    
    class blindClass : NSObject {
        var level : String
        var time : NSTimeInterval
        var ante : String
        var sBlind : String
        var bBlind : String
        
        init(level : String, time : NSTimeInterval, ante : String, sBlind : String, bBlind : String) {
            self.level = level
            self.time = time
            self.ante = ante
            self.sBlind = sBlind
            self.bBlind = bBlind
            
        }
        
        func getAsString() -> String{
            return level
        }
        
    }
    
    func tableView(blindTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(blindTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.blindsTable.dequeueReusableCellWithIdentifier("blindCell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell    }
    
    func tableView(blindTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blindsTable.delegate = self
        self.blindsTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "blindCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func breakSwitch(sender: AnyObject) {
        
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        let newLevel = blindClass(level: "Level 1", time: 180, ante: anteInput.text!, sBlind: smallInput.text!, bBlind: bigInput.text!)
        self.blindArray.append(newLevel)
        let arrayString = "Small Blind:" + (newLevel.sBlind) + " " + "Big Blind: " + (newLevel.bBlind)
        let arraycount = blindArray.count
        NSLog(arrayString)
        NSLog(String(arraycount))
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
