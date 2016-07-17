//
//  serverHelper.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation

public class serverHelper  {
    
    static let urlPath: String = "http://52.37.67.44:8080"
    
    public class func GetRequest() {
        let url: NSURL = NSURL(string: urlPath)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
    }
}
    