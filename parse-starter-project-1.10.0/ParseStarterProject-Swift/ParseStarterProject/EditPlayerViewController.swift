//
//  EditPlayerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/14/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class EditPlayerViewController: UIViewController {
    
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
                //player["PointsInt"] = Int(self.pointInput.text!)
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
