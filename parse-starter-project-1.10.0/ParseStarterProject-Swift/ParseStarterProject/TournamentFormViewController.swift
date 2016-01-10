//
//  TournamentFormViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class TournamentFormViewController: UIViewController {

    @IBOutlet weak var tourneyNameInput: UITextField!
    @IBOutlet weak var tourneyDate: UIDatePicker!
    
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
    
    @IBAction func saveBtn(sender: AnyObject) {
        
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
