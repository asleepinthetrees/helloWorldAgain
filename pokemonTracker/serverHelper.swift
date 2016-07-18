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
    
    public class func thisThing() {
        let mapDict = [ "1":"First", "2":"Second"]
        
        let json = [ "title":"ABC" , "dict": mapDict ]
        var jsonData : NSData?
        
        do  {
            jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: [])
        }
        catch
        {
            // Exception lands us here
            print("Caught error:", error)
        }
        // create post request
        let url = NSURL(string: "http://52.37.67.44:8080")!
        //let url = NSURL(string: "http://10.38.3.190:8080")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "PUT"
        
        // insert json data to the request
        request.HTTPBody = jsonData
        //request.HTTPBody = NS([UInt8]("test".utf8))
        //var buf = [UInt8]("test".utf8)
        //request.HTTPBodyStream = NSInputStream(data: NSData(bytes: buf, length: buf.count))
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            do {
                if let responseJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]{
                    if let str = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                        print(str)
                    }
                }
            } catch {
                // handle exceptiopn
            }
        }
        
        task.resume()
    }
}
    