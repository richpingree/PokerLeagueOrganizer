//
//  TournamentViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse


class TournamentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tourneyTable: UITableView!
    
    var tourneyArray : NSMutableArray = []
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tourneyTable.delegate = self
        tourneyTable.dataSource = self
        self.tourneyTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tourneyCell")
        
        // set up the refresh control
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tourneyTable?.addSubview(refreshControl)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        loadTourneyData()
    }
    
    func loadTourneyData(){
        
        self.tourneyArray.removeAllObjects()
        
        let query = PFQuery(className: "Tournaments")
        
        
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            if error == nil{
                
                //loop objects array
                for object in objects!{
                    
                    let tournament = object as PFObject
                    //add into array
                    self.tourneyArray.addObject(tournament)
                }
                // tell refresh control it can stop showing up now
                if self.refreshControl.refreshing
                {
                    self.refreshControl.endRefreshing()
                }
                self.tourneyTable.reloadData()
                
            } else{
                
            }
        }
    }
    
    func refresh(sender:AnyObject) {
        self.loadTourneyData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tourneyArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tourneyTable.dequeueReusableCellWithIdentifier("tourneyCell")! as UITableViewCell
        
        let tempObject = tourneyArray.objectAtIndex(indexPath.row) as! PFObject
        cell.textLabel!.text = tempObject.objectForKey("Date") as? String
        
        return cell    }
    

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            if self.tourneyArray.count >= 1{
                let selectedObject = tourneyArray.objectAtIndex(indexPath.row)  as! PFObject
                selectedObject.deleteInBackground()
                self.tourneyArray.removeObjectAtIndex(indexPath.row)
                self.tourneyTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                self.tourneyTable.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        performSegueWithIdentifier("TournamentDetailView", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        loadTourneyData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "TournamentDetailView" {
            if let destination = segue.destinationViewController as? TournamentDetailsViewController{
                
                // Pass the selected object to the new view controller.
                if let detailIndex = tourneyTable.indexPathForSelectedRow?.row{
                    let currentObject = tourneyArray.objectAtIndex(detailIndex) as! PFObject
                    
                    let tourneyDate = currentObject.objectForKey("Date") as? String
                    
                    let firstName = currentObject.objectForKey("P1Name") as? String
                    let firstPoints = currentObject.objectForKey("P1Points") as? String
                    let firstEarnings = currentObject.objectForKey("P1Winnings") as? String
                    
                    let secondName = currentObject.objectForKey("P2Name") as? String
                    let secondPoints = currentObject.objectForKey("P2Points") as? String
                    let secondEarnings = currentObject.objectForKey("P2Winnings") as? String
                    
                    let thirdName = currentObject.objectForKey("P3Name") as? String
                    let thirdPoints = currentObject.objectForKey("P3Points") as? String
                    let thirdEarnings = currentObject.objectForKey("P3Winnings") as? String
                    
                    let fourthName = currentObject.objectForKey("P4Name") as? String
                    let fourthPoints = currentObject.objectForKey("P4Points") as? String
                    let fourthEarnings = currentObject.objectForKey("P4Winnings") as? String
                    
                    let fifthName = currentObject.objectForKey("P5Name") as? String
                    let fifthPoints = currentObject.objectForKey("P5Points") as? String
                    let fifthEarnings = currentObject.objectForKey("P5Winnings") as? String
                    
                    let sixthName = currentObject.objectForKey("P6Name") as? String
                    let sixthPoints = currentObject.objectForKey("P6Points") as? String
                    let sixthEarnings = currentObject.objectForKey("P6Winnings") as? String
                    
                    let seventhName = currentObject.objectForKey("P7Name") as? String
                    let seventhPoints = currentObject.objectForKey("P7Points") as? String
                    let seventhEarnings = currentObject.objectForKey("P7Winnings") as? String
                    
                    let eighthName = currentObject.objectForKey("P8Name") as? String
                    let eighthPoints = currentObject.objectForKey("P8Points") as? String
                    let eighthEarnings = currentObject.objectForKey("P8Winnings") as? String
                    
                    let ninthName = currentObject.objectForKey("P9Name") as? String
                    let ninthPoints = currentObject.objectForKey("P9Points") as? String
                    let ninthEarnings = currentObject.objectForKey("P9Winnings") as? String
                    
                    let tenthName = currentObject.objectForKey("P10Name") as? String
                    let tenthPoints = currentObject.objectForKey("P10Points") as? String
                    let tenthEarnings = currentObject.objectForKey("P10Winnings") as? String
                    
                    destination.dateString = tourneyDate
                    
                    destination.firstNameString = firstName
                    destination.firstPointsString = firstPoints
                    destination.firstEarningsString = firstEarnings
                    
                    destination.secondNameString = secondName
                    destination.secondPointsString = secondPoints
                    destination.secondEarningsString = secondEarnings
                    
                    destination.thirdNameString = thirdName
                    destination.thirdPointsString = thirdPoints
                    destination.thirdEarningsString = thirdEarnings
                    
                    destination.fourthNameString = fourthName
                    destination.fourthPointsString = fourthPoints
                    destination.fourthEarningsString = fourthEarnings
                    
                    destination.fifthNameString = fifthName
                    destination.fifthPointsString = fifthPoints
                    destination.fifthEarningsString = fifthEarnings
                    
                    destination.sixthNameString = sixthName
                    destination.sixthPointsString = sixthPoints
                    destination.sixthEarningsString = sixthEarnings
                    
                    destination.seventhNameString = seventhName
                    destination.seventhPointsString = seventhPoints
                    destination.seventhEarningsString = seventhEarnings
                    
                    destination.eighthNameString = eighthName
                    destination.eighthPointsString = eighthPoints
                    destination.eighthEarningsString = eighthEarnings
                    
                    destination.ninthNameString = ninthName
                    destination.ninthPointsString = ninthPoints
                    destination.ninthEarningsString = ninthEarnings
                    
                    destination.tenthNameString = tenthName
                    destination.tenthPointsString = tenthPoints
                    destination.tenthEarningsString = tenthEarnings
                }
            }
            
        }
        
    }
    

}
