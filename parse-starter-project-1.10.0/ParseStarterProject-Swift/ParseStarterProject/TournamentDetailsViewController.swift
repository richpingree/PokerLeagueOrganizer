//
//  TournamentDetailsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class TournamentDetailsViewController: UIViewController {

    
    var dateString: String!
    var firstNameString: String!
    var firstPointsString: String!
    var firstEarningsString: String!
    var secondNameString: String!
    var secondPointsString: String!
    var secondEarningsString: String!
    var thirdNameString: String!
    var thirdPointsString: String!
    var thirdEarningsString: String!
    var fourthNameString: String!
    var fourthPointsString: String!
    var fourthEarningsString: String!
    var fifthNameString: String!
    var fifthPointsString: String!
    var fifthEarningsString: String!
    var sixthNameString: String!
    var sixthPointsString: String!
    var sixthEarningsString: String!
    var seventhNameString: String!
    var seventhPointsString: String!
    var seventhEarningsString: String!
    var eighthNameString: String!
    var eighthPointsString: String!
    var eighthEarningsString: String!
    var ninthNameString: String!
    var ninthPointsString: String!
    var ninthEarningsString: String!
    var tenthNameString: String!
    var tenthPointsString: String!
    var tenthEarningsString: String!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstPoints: UILabel!
    @IBOutlet weak var firstEarnings: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var secondPoints: UILabel!
    @IBOutlet weak var secondEarnings: UILabel!
    @IBOutlet weak var thirdName: UILabel!
    @IBOutlet weak var thirdPoints: UILabel!
    @IBOutlet weak var thirdEarnings: UILabel!
    @IBOutlet weak var fourthName: UILabel!
    @IBOutlet weak var fourthPoints: UILabel!
    @IBOutlet weak var fourthEarnings: UILabel!
    @IBOutlet weak var fifthName: UILabel!
    @IBOutlet weak var fifthPoints: UILabel!
    @IBOutlet weak var fifthEarnings: UILabel!
    @IBOutlet weak var sixthName: UILabel!
    @IBOutlet weak var sixthPoints: UILabel!
    @IBOutlet weak var sixthEarnings: UILabel!
    @IBOutlet weak var seventhName: UILabel!
    @IBOutlet weak var seventhPoints: UILabel!
    @IBOutlet weak var seventhEarnings: UILabel!
    @IBOutlet weak var eighthName: UILabel!
    @IBOutlet weak var eighthPoints: UILabel!
    @IBOutlet weak var eighthEarnings: UILabel!
    @IBOutlet weak var ninthName: UILabel!
    @IBOutlet weak var ninthPoints: UILabel!
    @IBOutlet weak var ninthEarnings: UILabel!
    @IBOutlet weak var tenthName: UILabel!
    @IBOutlet weak var tenthPoints: UILabel!
    @IBOutlet weak var tenthEarnings: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.date.text = self.dateString
        
        self.firstName.text = self.firstNameString
        self.firstPoints.text = self.firstPointsString
        self.firstEarnings.text = "$" + self.firstEarningsString
        
        self.secondName.text = self.secondNameString
        self.secondPoints.text = self.secondPointsString
        self.secondEarnings.text = "$" + self.secondEarningsString
        
        self.thirdName.text = self.thirdNameString
        self.thirdPoints.text = self.thirdPointsString
        self.thirdEarnings.text = "$" + self.thirdEarningsString
        
        self.fourthName.text = self.fourthNameString
        self.fourthPoints.text = self.fourthPointsString
        self.fourthEarnings.text = "$" + self.fourthEarningsString
        
        self.fifthName.text = self.fifthNameString
        self.fifthPoints.text = self.fifthPointsString
        self.fifthEarnings.text = "$" + self.fifthEarningsString
        
        self.sixthName.text = self.sixthNameString
        self.sixthPoints.text = self.sixthPointsString
        self.sixthEarnings.text = "$" + self.sixthEarningsString
        
        self.seventhName.text = self.seventhNameString
        self.seventhPoints.text = self.seventhPointsString
        self.seventhEarnings.text = "$" + self.seventhEarningsString
        
        self.eighthName.text = self.eighthNameString
        self.eighthPoints.text = self.eighthPointsString
        self.eighthEarnings.text = "$" + self.eighthEarningsString
        
        self.ninthName.text = self.ninthNameString
        self.ninthPoints.text = self.ninthPointsString
        self.ninthEarnings.text = "$" + self.ninthEarningsString
        
        self.tenthName.text = self.tenthNameString
        self.tenthPoints.text = self.tenthPointsString
        self.tenthEarnings.text = "$" + self.tenthEarningsString
    }
    
    override func viewWillAppear(animated: Bool) {
        self.date.text = self.dateString
        
        self.firstName.text = self.firstNameString
        self.firstPoints.text = self.firstPointsString
        self.firstEarnings.text = "$" + self.firstEarningsString
        
        self.secondName.text = self.secondNameString
        self.secondPoints.text = self.secondPointsString
        self.secondEarnings.text = "$" + self.secondEarningsString
        
        self.thirdName.text = self.thirdNameString
        self.thirdPoints.text = self.thirdPointsString
        self.thirdEarnings.text = "$" + self.thirdEarningsString
        
        self.fourthName.text = self.fourthNameString
        self.fourthPoints.text = self.fourthPointsString
        self.fourthEarnings.text = "$" + self.fourthEarningsString
        
        self.fifthName.text = self.fifthNameString
        self.fifthPoints.text = self.fifthPointsString
        self.fifthEarnings.text = "$" + self.fifthEarningsString
        
        self.sixthName.text = self.sixthNameString
        self.sixthPoints.text = self.sixthPointsString
        self.sixthEarnings.text = "$" + self.sixthEarningsString
        
        self.seventhName.text = self.seventhNameString
        self.seventhPoints.text = self.seventhPointsString
        self.seventhEarnings.text = "$" + self.seventhEarningsString
        
        self.eighthName.text = self.eighthNameString
        self.eighthPoints.text = self.eighthPointsString
        self.eighthEarnings.text = "$" + self.eighthEarningsString
        
        self.ninthName.text = self.ninthNameString
        self.ninthPoints.text = self.ninthPointsString
        self.ninthEarnings.text = "$" + self.ninthEarningsString
        
        self.tenthName.text = self.tenthNameString
        self.tenthPoints.text = self.tenthPointsString
        self.tenthEarnings.text = "$" + self.tenthEarningsString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
