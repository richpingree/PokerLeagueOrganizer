//
//  PlayerFormViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class PlayerFormViewController: UIViewController {

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var totalPointsInput: UITextField!
    @IBOutlet weak var totalEarningsInput: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveBtn(sender: AnyObject) {
        let newPlayer = PFObject(className: "Player")
        newPlayer["First"] = firstNameInput.text
        newPlayer["Last"] = lastNameInput.text
        newPlayer["Phone"] = phoneNumberInput.text
        newPlayer["Points"] = totalPointsInput.text
        newPlayer["Earnings"] = totalEarningsInput.text
        newPlayer.saveEventually{
            (success: Bool, error: NSError?) -> Void in
            if (success){
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                
            }
        }
        
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
