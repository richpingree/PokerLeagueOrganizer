//
//  TournamentFormViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class TournamentFormViewController: UIViewController {


    @IBOutlet weak var tourneyDate: UITextField!
    
    @IBOutlet weak var player1NameInput: UITextField!
    @IBOutlet weak var player1PointsInput: UITextField!
    @IBOutlet weak var player1WinningsInput: UITextField!
    
    @IBOutlet weak var player2NameInput: UITextField!
    @IBOutlet weak var player2PointsInput: UITextField!
    @IBOutlet weak var player2WinningsInput: UITextField!
    
    @IBOutlet weak var player3NameInput: UITextField!
    @IBOutlet weak var player3PointsInput: UITextField!
    @IBOutlet weak var player3WinningsInput: UITextField!
    
    @IBOutlet weak var player4NameInput: UITextField!
    @IBOutlet weak var player4PointsInput: UITextField!
    @IBOutlet weak var player4WinningsInput: UITextField!
    
    @IBOutlet weak var player5NameInput: UITextField!
    @IBOutlet weak var player5PointsInput: UITextField!
    @IBOutlet weak var player5WinningsInput: UITextField!
    
    @IBOutlet weak var player6NameInput: UITextField!
    @IBOutlet weak var player6PointsInput: UITextField!
    @IBOutlet weak var player6WinningsInput: UITextField!
    
    @IBOutlet weak var player7NameInput: UITextField!
    @IBOutlet weak var player7PointsInput: UITextField!
    @IBOutlet weak var player7WinningsInput: UITextField!
    
    @IBOutlet weak var player8NameInput: UITextField!
    @IBOutlet weak var player8PointsInput: UITextField!
    @IBOutlet weak var player8WinningsInput: UITextField!
    
    @IBOutlet weak var player9NameInput: UITextField!
    @IBOutlet weak var player9PointsInput: UITextField!
    @IBOutlet weak var player9WinningsInput: UITextField!
    
    @IBOutlet weak var player10NameInput: UITextField!
    @IBOutlet weak var player10PointsInput: UITextField!
    @IBOutlet weak var player10WinningsInput: UITextField!
    
       @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tourneyDateEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        tourneyDate.text = dateFormatter.stringFromDate(sender.date)
        
    }
   

    @IBAction func saveBtn(sender: AnyObject) {
        let newTourney = PFObject(className: "Tournaments")
        newTourney["Date"] = tourneyDate.text
        newTourney["P1Name"] = player1NameInput.text
        newTourney["P1Points"] = player1PointsInput.text
        newTourney["P1Winnings"] = player1WinningsInput.text
        newTourney["P2Name"] = player2NameInput.text
        newTourney["P2Points"] = player2PointsInput.text
        newTourney["P2Winnings"] = player2WinningsInput.text
        newTourney["P3Name"] = player3NameInput.text
        newTourney["P3Points"] = player3PointsInput.text
        newTourney["P3Winnings"] = player3WinningsInput.text
        newTourney["P4Name"] = player4NameInput.text
        newTourney["P4Points"] = player4PointsInput.text
        newTourney["P4Winnings"] = player4WinningsInput.text
        newTourney["P5Name"] = player5NameInput.text
        newTourney["P5Points"] = player5PointsInput.text
        newTourney["P5Winnings"] = player5WinningsInput.text
        newTourney["P6Name"] = player6NameInput.text
        newTourney["P6Points"] = player6PointsInput.text
        newTourney["P6Winnings"] = player6WinningsInput.text
        newTourney["P7Name"] = player7NameInput.text
        newTourney["P7Points"] = player7PointsInput.text
        newTourney["P7Winnings"] = player7WinningsInput.text
        newTourney["P8Name"] = player8NameInput.text
        newTourney["P8Points"] = player8PointsInput.text
        newTourney["P8Winnings"] = player8WinningsInput.text
        newTourney["P9Name"] = player9NameInput.text
        newTourney["P9Points"] = player9PointsInput.text
        newTourney["P9Winnings"] = player9WinningsInput.text
        newTourney["P10Name"] = player10NameInput.text
        newTourney["P10Points"] = player10PointsInput.text
        newTourney["P10Winnings"] = player10WinningsInput.text
        
        newTourney.saveEventually() {
            (success: Bool, error: NSError?) -> Void in
            if (success){
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                
            }
        }
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
