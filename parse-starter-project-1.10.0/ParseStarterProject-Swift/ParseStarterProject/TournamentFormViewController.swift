//
//  TournamentFormViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class TournamentFormViewController: UIViewController, UITextFieldDelegate {


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
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        initializeTextFields()
        
        let timeString = dateFormatter.stringFromDate(NSDate())

        tourneyDate.text = timeString
    }
    
    //Designate this class as the text fields' delegate and set their keyboards while we're at it
    func initializeTextFields(){
        player1PointsInput.delegate = self
        player1PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player1WinningsInput.delegate = self
        player1WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player2PointsInput.delegate = self
        player2PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player2WinningsInput.delegate = self
        player2WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player3PointsInput.delegate = self
        player3PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player3WinningsInput.delegate = self
        player3WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player4PointsInput.delegate = self
        player4PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player4WinningsInput.delegate = self
        player4WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player5PointsInput.delegate = self
        player5PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player5WinningsInput.delegate = self
        player5WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player6PointsInput.delegate = self
        player6PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player6WinningsInput.delegate = self
        player6WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player7PointsInput.delegate = self
        player7PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player7WinningsInput.delegate = self
        player7WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player8PointsInput.delegate = self
        player8PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player8WinningsInput.delegate = self
        player8WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player9PointsInput.delegate = self
        player9PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player9WinningsInput.delegate = self
        player9WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player10PointsInput.delegate = self
        player10PointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        player10WinningsInput.delegate = self
        player10WinningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
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
                
            case player1PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player1WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player2PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player2WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player3PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player3WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player4PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player4WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player5PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player5WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player6PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player6WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player7PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player7WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player8PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player8WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player9PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player9WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case player10PointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 4
                
            case player10WinningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            default:
                return true
            }
            
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //check that all fields are complete
    func checkTourneyDate() {
        if (tourneyDate.text!.isEmpty){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            let timeString = dateFormatter.stringFromDate(NSDate())
            
            tourneyDate.text = timeString
            checkP1Name()
        } else{
            checkP1Name()
        }
    }
    
    func checkP1Name(){
        if (player1NameInput.text!.isEmpty){
            player1NameInput.text = "No Player"
            checkP1Points()
        } else{
            checkP1Points()
        }
    }
    
    func checkP1Points(){
        if (player1PointsInput.text!.isEmpty){
            player1PointsInput.text = "0"
            checkP1Earnings()
        }else{
            checkP1Earnings()
        }
    }
    
    func checkP1Earnings(){
        if (player1WinningsInput.text!.isEmpty){
            player1WinningsInput.text = "0"
            checkP2Name()
        }else{
            checkP2Name()
        }
    }
    
    func checkP2Name(){
        if (player2NameInput.text!.isEmpty){
            player2NameInput.text = "No Player"
            checkP2Points()
        } else{
            checkP2Points()
        }
    }
    
    func checkP2Points(){
        if (player2PointsInput.text!.isEmpty){
            player2PointsInput.text = "0"
            checkP2Earnings()
        }else{
            checkP2Earnings()
        }
    }
    
    func checkP2Earnings(){
        if (player2WinningsInput.text!.isEmpty){
            player2WinningsInput.text = "0"
            checkP3Name()
        }else{
            checkP3Name()
        }
    }
    
    func checkP3Name(){
        if (player3NameInput.text!.isEmpty){
            player3NameInput.text = "No Player"
            checkP3Points()
        } else{
            checkP3Points()
        }
    }
    
    func checkP3Points(){
        if (player3PointsInput.text!.isEmpty){
            player3PointsInput.text = "0"
            checkP3Earnings()
        }else{
            checkP3Earnings()
        }
    }
    
    func checkP3Earnings(){
        if (player3WinningsInput.text!.isEmpty){
            player3WinningsInput.text = "0"
            checkP4Name()
        }else{
            checkP4Name()
        }
    }

    func checkP4Name(){
        if (player4NameInput.text!.isEmpty){
            player4NameInput.text = "No Player"
            checkP4Points()
        } else{
            checkP4Points()
        }
    }
    
    func checkP4Points(){
        if (player4PointsInput.text!.isEmpty){
            player4PointsInput.text = "0"
            checkP4Earnings()
        }else{
            checkP4Earnings()
        }
    }
    
    func checkP4Earnings(){
        if (player4WinningsInput.text!.isEmpty){
            player4WinningsInput.text = "0"
            checkP5Name()
        }else{
            checkP5Name()
        }
    }

    func checkP5Name(){
        if (player5NameInput.text!.isEmpty){
            player5NameInput.text = "No Player"
            checkP5Points()
        } else{
            checkP5Points()
        }
    }
    
    func checkP5Points(){
        if (player5PointsInput.text!.isEmpty){
            player5PointsInput.text = "0"
            checkP5Earnings()
        }else{
            checkP5Earnings()
        }
    }
    
    func checkP5Earnings(){
        if (player5WinningsInput.text!.isEmpty){
            player5WinningsInput.text = "0"
            checkP6Name()
        }else{
            checkP6Name()
        }
    }
    
    func checkP6Name(){
        if (player6NameInput.text!.isEmpty){
            player6NameInput.text = "No Player"
            checkP6Points()
        } else{
            checkP6Points()
        }
    }
    
    func checkP6Points(){
        if (player6PointsInput.text!.isEmpty){
            player6PointsInput.text = "0"
            checkP6Earnings()
        }else{
            checkP6Earnings()
        }
    }
    
    func checkP6Earnings(){
        if (player6WinningsInput.text!.isEmpty){
            player6WinningsInput.text = "0"
            checkP7Name()
        }else{
            checkP7Name()
        }
    }


    func checkP7Name(){
        if (player7NameInput.text!.isEmpty){
            player7NameInput.text = "No Player"
            checkP7Points()
        } else{
            checkP7Points()
        }
    }
    
    func checkP7Points(){
        if (player7PointsInput.text!.isEmpty){
            player7PointsInput.text = "0"
            checkP7Earnings()
        }else{
            checkP7Earnings()
        }
    }
    
    func checkP7Earnings(){
        if (player7WinningsInput.text!.isEmpty){
            player7WinningsInput.text = "0"
            checkP8Name()
        }else{
            checkP8Name()
        }
    }

    func checkP8Name(){
        if (player8NameInput.text!.isEmpty){
            player8NameInput.text = "No Player"
            checkP8Points()
        } else{
            checkP8Points()
        }
    }
    
    func checkP8Points(){
        if (player8PointsInput.text!.isEmpty){
            player8PointsInput.text = "0"
            checkP8Earnings()
        }else{
            checkP8Earnings()
        }
    }
    
    func checkP8Earnings(){
        if (player8WinningsInput.text!.isEmpty){
            player8WinningsInput.text = "0"
            checkP9Name()
        }else{
            checkP9Name()
        }
    }

    func checkP9Name(){
        if (player9NameInput.text!.isEmpty){
            player9NameInput.text = "No Player"
            checkP9Points()
        } else{
            checkP9Points()
        }
    }
    
    func checkP9Points(){
        if (player9PointsInput.text!.isEmpty){
            player9PointsInput.text = "0"
            checkP9Earnings()
        }else{
            checkP9Earnings()
        }
    }
    
    func checkP9Earnings(){
        if (player9WinningsInput.text!.isEmpty){
            player9WinningsInput.text = "0"
            checkP10Name()
        }else{
            checkP10Name()
        }
    }
    
    func checkP10Name(){
        if (player10NameInput.text!.isEmpty){
            player10NameInput.text = "No Player"
            checkP10Points()
        } else{
            checkP10Points()
        }
    }
    
    func checkP10Points(){
        if (player10PointsInput.text!.isEmpty){
            player10PointsInput.text = "0"
            checkP10Earnings()
        }else{
            checkP10Earnings()
        }
    }
    
    func checkP10Earnings(){
        if (player10WinningsInput.text!.isEmpty){
            player10WinningsInput.text = "0"
            let alert = UIAlertView(title: "Empty Fields Existed", message: "This fields have been auto populated. Please double check that data is correct and press the Save button again", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else{
            saveTourney()
        }
    }

    func saveTourney() {
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
   
    @IBAction func cancelBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveBtn(sender: AnyObject) {
        checkTourneyDate()
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
