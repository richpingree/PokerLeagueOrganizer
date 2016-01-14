//
//  TournamentDetailsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class TournamentDetailsViewController: UIViewController {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstPoints: UILabel!
    @IBOutlet weak var firstEarnings: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var secondPoints: UILabel!
    @IBOutlet weak var secondEarnings: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
