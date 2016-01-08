//
//  RegisterViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/3/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmEmailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check that emails match
    func checkEmailMatch() {
        if emailTxt.text != confirmEmailTxt.text{
            let alert = UIAlertView(title: "Email address mismatch", message: "Please check email address and try again", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    //check that passwords match
    func checkPasswordMatch(){
        if passTxt.text != confirmPassTxt.text{
            let alert = UIAlertView(title: "Password mismatch", message: "Please check and enter again", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    //check that all fields are complete
    func checkFieldComplete() {
        if userTxt.text!.isEmpty || emailTxt.text!.isEmpty || confirmEmailTxt.text!.isEmpty || passTxt.text!.isEmpty || confirmEmailTxt.text!.isEmpty {
            let alert = UIAlertView(title: "All Fields are Required", message: "Please check the fields and try again", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        } else {
            checkEmailMatch()
            checkPasswordMatch()
        }
    }
    
    
    //register user
    func signUp() {
        let user = PFUser()
        user.username = self.userTxt.text
        user.email = self.emailTxt.text
        user.password = self.passTxt.text
        
        user.signUpInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            if let error = error {
                _ = error.userInfo["error"] as? NSString
                let alert = UIAlertView(title: "Ooops", message: "Username is already taken", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            } else {
                NSLog("Sign Up Success!")
            }
        }
    }
    

    @IBAction func loginBtn(sender: AnyObject) {
        checkFieldComplete()
        signUp()
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
