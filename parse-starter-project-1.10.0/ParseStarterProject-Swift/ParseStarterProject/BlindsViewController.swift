//
//  BlindsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 12/29/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ObjectiveC



class BlindsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var anteInput: UITextField!
    @IBOutlet weak var smallInput: UITextField!
    @IBOutlet weak var bigInput: UITextField!
    @IBOutlet weak var breakSwitch: UISwitch!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var blindsTable: UITableView!
    
    var blindArray : NSMutableArray = []
    
    //var items: [String] = ["Blind1", "Blind2", "Blind3"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blindsTable.delegate = self
        blindsTable.dataSource = self
        //self.blindsTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "blindCell")
        loadData1()
        
    }
    
    
    
    func loadData1() {
        
        self.blindArray.removeAllObjects()
        
        let query = PFQuery(className: "BlindLevel")
        
        query.orderByAscending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                //loop your objects array
                for object in objects!{
                    
                    let blindLevel = object as PFObject
                    //add your element into array
                    self.blindArray.addObject(blindLevel)
                }
                self.blindsTable.reloadData()
                
            } else {
                
                //println( error?.userInfo )
            }
        }
        
    }
    

    func tableView(blindsTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.blindArray.count
    }
    
    func tableView(blindsTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.blindsTable.dequeueReusableCellWithIdentifier("blindCell")! as UITableViewCell
        
        let tempObject = blindArray.objectAtIndex(indexPath.row) as! PFObject
        
        let timeString = "Time: " + (tempObject.objectForKey("Time") as? String)!
        let anteString = "Ante: " + (tempObject.objectForKey("Ante") as? String)!
        let smallString = "Small Blind: " + (tempObject.objectForKey("Small") as? String)!
        let bigString = "Big Blind: " + (tempObject.objectForKey("Big") as? String)!
        
        cell.textLabel?.text = timeString + " min"
        cell.detailTextLabel?.text = anteString + " " + smallString + " " + bigString
        
        return cell
    }
    
    func tableView(blindsTable: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            if self.blindArray.count >= 1{
                let selectedObject = blindArray.objectAtIndex(indexPath.row)  as! PFObject
                selectedObject.deleteInBackground()
                self.blindArray.removeObjectAtIndex(indexPath.row)
                self.blindsTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                self.blindsTable.reloadData()
            }
        }
    }
    
    func tableView(blindTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.blindsTable.editing = !self.editing
    }
    
    func tableView(blindTable: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(blindTable: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let itemToMove = self.blindArray[fromIndexPath.row]
        self.blindArray.removeObjectAtIndex(fromIndexPath.row)
        self.blindArray.insertObject(itemToMove, atIndex: toIndexPath.row)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func breakSwitch(sender: AnyObject) {
        if (breakSwitch.on){
            self.timeInput.text = "10"
            self.anteInput.enabled = false
            self.anteInput.text = "0"
            self.smallInput.enabled = false
            self.smallInput.text = "0"
            self.bigInput.enabled = false
            self.bigInput.text = "0"
            
        }else{
            self.timeInput.text = "25"
            self.anteInput.enabled = true
            self.anteInput.text = "0"
            self.smallInput.enabled = true
            self.smallInput.text = "5"
            self.bigInput.enabled = true
            self.bigInput.text = "10"

        }
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        let bLevel = PFObject(className: "BlindLevel")
        bLevel["Time"] = timeInput.text
        bLevel["Ante"] = anteInput.text
        bLevel["Small"] = smallInput.text
        bLevel["Big"] = bigInput.text
        bLevel.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                self.loadData1()
            } else {
                // There was a problem, check error.description
            }
        }
    }
    @IBAction func doneBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
