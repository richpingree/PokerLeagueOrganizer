//
//  EditPlayerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/14/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class EditPlayerViewController: UIViewController, UITextFieldDelegate {
    
    var objectId: String!
    var firstName: String!
    var lastName: String!
    var phone: String!
    var points: String!
    var earnings: String!
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var pointInput: UITextField!
    @IBOutlet weak var earningInput: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.firstNameInput.text = self.firstName
        self.lastNameInput.text = self.lastName
        self.phoneInput.text = self.phone
        self.pointInput.text = self.points
        self.earningInput.text = self.earnings
        print(self.objectId)
        
    }
    
    //Designate this class as the text fields' delegate and set their keyboards while we're at it
    func initializeTextFields(){
        phoneInput.delegate = self
        phoneInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        pointInput.delegate = self
        pointInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        earningInput.delegate = self
        earningInput.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
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
                
            case phoneInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 12
                
            case pointInput:
                return prospectiveText.isNumeric() &&
                    prospectiveText.characters.count <= 5
                
            case earningInput:
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
    
    @IBAction func cancelBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
        
        let currentObject = self.objectId
        
        let query = PFQuery(className: "Player")
        
        query.getObjectInBackgroundWithId(currentObject) {
            (player: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let player = player {
                player["First"] = self.firstNameInput.text
                player["Last"] = self.lastNameInput.text
                player["Phone"] = self.phoneInput.text
                player["Points"] = self.pointInput.text
                player["Earnings"] = self.earningInput.text
                player["PointsInt"] = Int(self.pointInput.text!)
                player.saveEventually{
                    (success: Bool, error: NSError?) -> Void in
                    if (success){
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }else{
                                            
                    }
                }
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
