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

        loadPlayerData()
    }
    
    func loadPlayerData(){
        
        self.playerArray.removeAllObjects()
        
        let query = PFQuery(className: "Player")
        
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


    func tableView(playerTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerArray.count
    }
    
    func tableView(playerTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.playerTable.dequeueReusableCellWithIdentifier("playerCell")! as UITableViewCell
        
        let tempObject = playerArray.objectAtIndex(indexPath.row) as! PFObject
        cell.textLabel?.text = tempObject.objectForKey("First") as? String
        
        return cell    }
    
    func tableView(playerTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
