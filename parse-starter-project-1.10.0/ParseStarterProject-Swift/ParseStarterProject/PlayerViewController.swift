//
//  PlayerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class PlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var randomBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var playerTable: UITableView!
    
    var playerArray : NSMutableArray = []
    var sortByArray = ["First", "Last", "createdAt", "objectID"]
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
        playerTable.delegate = self
        playerTable.dataSource = self
        self.playerTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "playerCell")
        
        // set up the refresh control
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.playerTable?.addSubview(refreshControl)

    }
    
    override func viewWillAppear(animated: Bool) {
        loadPlayerData()
    }
    
    func loadPlayerData(){
        
        self.playerArray.removeAllObjects()
        
        let query = PFQuery(className: "Player")
        
        //query.orderByDescending("PointsInt")
        query.findObjectsInBackgroundWithBlock{
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil{
                
                //loop objects array
                for object in objects!{
                    let player = object as PFObject
                    
                    //add element into array
                    self.playerArray.addObject(player)
                }
                // tell refresh control it can stop showing up now
                if self.refreshControl.refreshing
                {
                    self.refreshControl.endRefreshing()
                }

                self.playerTable.reloadData()
                    
            } else{
                
            }
        }
    }
    
    func randomNumber(range: Range<Int> = 0...3) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
    func randomLoadData(){
        
        
        let randomIndex = randomNumber()
        
        self.playerArray.removeAllObjects()
        
        let query = PFQuery(className: "Player")
        
        query.orderByAscending(sortByArray[randomIndex])
        
        query.findObjectsInBackgroundWithBlock{
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil{
                
                //loop objects array
                for object in objects!{
                    let player = object as PFObject
                    
                    //add element into array
                    self.playerArray.addObject(player)
                    
                                    }
                // tell refresh control it can stop showing up now
                if self.refreshControl.refreshing
                {
                    self.refreshControl.endRefreshing()
                }
                
                self.playerTable.reloadData()
                
            } else{
                
            }
        }

    }
    
    func refresh(sender:AnyObject) {
        self.loadPlayerData()
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.playerTable.dequeueReusableCellWithIdentifier("playerCell")! as UITableViewCell
        
        let tempObject = playerArray.objectAtIndex(indexPath.row) as! PFObject
        cell.textLabel?.text = (tempObject.objectForKey("First") as? String)! + " " + (tempObject.objectForKey("Last") as? String)!
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            if self.playerArray.count >= 1{
                let selectedObject = playerArray.objectAtIndex(indexPath.row)  as! PFObject
                selectedObject.deleteInBackground()
                self.playerArray.removeObjectAtIndex(indexPath.row)
                self.playerTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                self.playerTable.reloadData()
            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueToEditPlayer", sender: self)
    }

    @IBAction func randomBtn(sender: AnyObject) {
        randomLoadData()
    }
    
    @IBAction func addBtn(sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "segueToEditPlayer" {
            if let destination = segue.destinationViewController as? EditPlayerViewController {
                 // Pass the selected object to the new view controller.
                if let detailIndex = playerTable.indexPathForSelectedRow?.row{
                    let currentObject = playerArray.objectAtIndex(detailIndex) as! PFObject
                    
                    let objectId = currentObject.objectId as String!
                    let firstName = currentObject.objectForKey("First") as? String
                    let lastName = currentObject.objectForKey("Last") as? String
                    let phone = currentObject.objectForKey("Phone") as? String
                    let points = currentObject.objectForKey("Points") as? String
                    let earnings = currentObject.objectForKey("Earnings") as? String
                    
                    destination.objectId = objectId
                    destination.firstName = firstName
                    destination.lastName = lastName
                    destination.phone = phone
                    destination.points = points
                    destination.earnings = earnings
                }
            }
            
        }

       
    }
    

}
