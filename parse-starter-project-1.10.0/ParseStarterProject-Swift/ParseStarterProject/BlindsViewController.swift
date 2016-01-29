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



class BlindsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
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
       
        initializeTextFields()
        
        //loads data from Parse
        loadData1()
        
    }
    
    //Designate this class as the text fields' delegate and set their keyboards while we're at it
    func initializeTextFields(){
        timeInput.delegate = self
        timeInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        anteInput.delegate = self
        anteInput.keyboardType = UIKeyboardType.NumberPad
        
        smallInput.delegate = self
        smallInput.keyboardType = UIKeyboardType.NumberPad
        
        bigInput.delegate = self
        bigInput.keyboardType = UIKeyboardType.NumberPad
    }
    
    //Tap outside a text field to dismiss the keyboard
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //UITextFieldDelegate events and related methods
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
        //We ignore any change that doesn't add characters to the text field.
        //These changes are things like character deletions and cuts, as well as moving the insertion point.
            
        //We still return true to all the change to take place
            if string.characters.count == 0{
                return true
            }
            
            //Check to see if the text field contents stell fit the constraints with the new content added to it
            let currentText = textField.text ?? ""
            let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(range, withString: string)
            
            switch textField{
                
            case timeInput:
                return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 2
                
            case anteInput:
                return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 5
                
            case smallInput:
                return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 5
                
            case bigInput:
                return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 5
                
            default:
                return true
            }
            
            
    }
    
    //pulls data from parse
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
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.blindArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.blindsTable.dequeueReusableCellWithIdentifier("blindCell")! as UITableViewCell
        
        let tempObject = blindArray.objectAtIndex(indexPath.row) as! PFObject
        
        let timeString = "Time: " + (tempObject.objectForKey("Time") as? String)!
        let anteString = "Ante: " + (tempObject.objectForKey("Ante") as? String)!
        let smallString = "Small Blind: " + (tempObject.objectForKey("Small") as? String)!
        let bigString = "Big Blind: " + (tempObject.objectForKey("Big") as? String)!
        
        cell.textLabel?.text = timeString + " min"
        cell.detailTextLabel?.text = anteString + "    " + smallString + "    " + bigString
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //puts table in edit mode
        
        //self.blindsTable.editing = !self.editing
    }
    
    //allows for row to move
//    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }

    //moves the row
//    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        
//        let itemToMove = self.blindArray[fromIndexPath.row]
//        self.blindArray.removeObjectAtIndex(fromIndexPath.row)
//        self.blindArray.insertObject(itemToMove, atIndex: toIndexPath.row)
//    }

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
