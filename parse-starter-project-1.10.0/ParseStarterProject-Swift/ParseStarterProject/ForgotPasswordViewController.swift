//
//  ForgotPasswordViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.emailInput.text = nil
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendBtn(sender: AnyObject) {
        let email = self.emailInput.text
        
        // Send a request to reset a password
        PFUser.requestPasswordResetForEmailInBackground(email!)
        
        let alert = UIAlertView(title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + email!, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
        self.dismissViewControllerAnimated(true, completion: nil)
//        if #available(iOS 8.0, *) {
//            let alert = UIAlertController (title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + email! + ".", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//            
////            dispatch_async(dispatch_get_main_queue(), { () -> Void in
////                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
////                self.presentViewController(viewController, animated: true, completion: nil)
////            })
//
//        } else {
//            // Fallback on earlier versions
//        }
        
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
