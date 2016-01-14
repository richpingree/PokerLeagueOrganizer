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

    func tableView(tourneyTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tourneyArray.count
    }
    
    func tableView(tourneyTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tourneyTable.dequeueReusableCellWithIdentifier("tourneyCell")! as UITableViewCell
        
        let tempObject = tourneyArray.objectAtIndex(indexPath.row) as! PFObject
        cell.textLabel!.text = tempObject.objectForKey("Date") as? String
        
        return cell    }
    
    func tableView(tourneyTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        loadTourneyData()
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
