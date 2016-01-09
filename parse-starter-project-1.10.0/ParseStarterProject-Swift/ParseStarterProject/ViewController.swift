/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse


class ViewController: UIViewController {

    @IBOutlet weak var LoginUserTxt: UITextField!
    @IBOutlet weak var LoginPassTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginUserTxt.text = nil
        LoginPassTxt.text = nil
        //check if connected to network
        if Reachability.isConnectedNetwork(){
            NSLog("Is connected to the Internet!")
        }else{
            NSLog("Not connected")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.LoginUserTxt.text!, password: self.LoginPassTxt.text!){
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil{
                NSLog("Login Successful")
                
                self.performSegueWithIdentifier("login", sender: self)
            }else{
                _ = UIAlertView(title: "Ooops", message: "Username is already taken", delegate: nil, cancelButtonTitle: "OK")
            }
        }
    }

    @IBAction func passBtn(sender: AnyObject) {
        
    }
    
    @IBAction func registerBtn(sender: AnyObject) {
        
    }
    
    }
