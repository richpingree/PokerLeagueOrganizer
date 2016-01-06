//
//  Reachability.swift
//  ParseStarterProject-Swift
//
//  Created by Richard Pingree on 1/5/16.
//  Copyright © 2016 Parse. All rights reserved.//

import Foundation


public class Reachability {
    
    class func isConnectedNetwork() -> Bool {
        var status:Bool = false
        let url = NSURL(string: "https://google.com")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "Head"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval =  10.0
        
        var response:NSURLResponse?
        
        
        do {
            let _ = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        if let httpResponse = response as? NSHTTPURLResponse{
            if httpResponse.statusCode == 200{
                status = true
            }
        }
        
        return status
    }
}