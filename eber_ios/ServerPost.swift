//
//  ServerPost.swift
//  eber_ios
//
//  Created by Minh Vu on 12/13/15.
//  Copyright © 2015 Huy. All rights reserved.
//

import Foundation

class ServerPost{
    private var url_string: String
    private var data = Dictionary<String, AnyObject>()
    
    init(url: String, data: Dictionary<String, AnyObject>){
        self.url_string = url
        self.data = data}
    
    func connection(completionHandler:(success:Bool, data: NSData?) -> Void){
        let url: NSURL = NSURL(string: self.url_string)!
        let request = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(self.data, options: [])
            request.HTTPBody = jsonData}
        catch{print("json error: \(error)")}
        
        // send the request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            if let unwrappedError = error {
                print("error=\(unwrappedError)")
            }
            else {
                if let unwrappedData = data {
                    completionHandler(success: true, data: unwrappedData)
                    return
                }
            }
            
            completionHandler(success: false, data: nil)
        }
        
        task.resume()
    }
}