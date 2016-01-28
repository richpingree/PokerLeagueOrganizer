//
//  PlayerFormViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class PlayerFormViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var totalPointsInput: UITextField!
    @IBOutlet weak var totalEarningsInput: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeTextFields()
    }
    
    //Designate this class as the text fields' delegate and set their keyboards while we're at it
    func initializeTextFields(){
        phoneNumberInput.delegate = self
        phoneNumberInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        totalPointsInput.delegate = self
        totalPointsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        totalEarningsInput.delegate = self
        totalEarningsInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
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
                
            case phoneNumberInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 12
                
            case totalPointsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case totalEarningsInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            default:
                return true
            }
            
            
    }



    @IBAction func saveBtn(sender: AnyObject) {
        let newPlayer = PFObject(className: "Player")
        newPlayer["First"] = firstNameInput.text
        newPlayer["Last"] = lastNameInput.text
        newPlayer["Phone"] = phoneNumberInput.text
        newPlayer["Points"] = totalPointsInput.text
        newPlayer["Earnings"] = totalEarningsInput.text
        newPlayer["PointsInt"] = Int(totalPointsInput.text!)
        newPlayer.saveEventually{
            (success: Bool, error: NSError?) -> Void in
            if (success){
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                
            }
        }
        
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
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
