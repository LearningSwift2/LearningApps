//
//  ViewController.swift
//  SimpleAppTransport
//
//  Created by Phil Wright on 3/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let postEndpoint: String = "http://jsonplaceholder.typicode.com/posts/1"
        
        guard let url = NSURL(string: postEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
        // Completion Handler for Task
        
        let myCompletionHandler: (NSData?, NSURLResponse?, NSError?) -> Void = {
            (data, response, error) in
            
            //print(response)
            //print(error)
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            guard error == nil else {
                print("error calling GET on /posts/1")
                print(error)
                return
            }
            
            // parse the result as JSON
            
            do {
                
                if let postDict = try NSJSONSerialization.JSONObjectWithData(responseData,
                    options: []) as? JSONDictionary {
                        
                        print(postDict)
                        
                        print("\n\n")
                        
                        if let body = postDict["body"] as? String {
                            print("The post is: \(body)")
                        }
                        
                        if let postTitle = postDict["title"] as? String {
                            print("The title is: \(postTitle)")
                        }
                        
                        if let userId = postDict["userId"] as? Int {
                            print("The userId is \(userId)")
                        }
                        
                        if let postId = postDict["id"] as? Int {
                            print("The post id is \(postId)")
                        }
                }
                
            } catch  {
                print("Error trying to convert data to JSON")
                return
            }
        }
        
        // GET
        
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: myCompletionHandler)
        
        task.resume()
        
        // POST
        
        
        let postsEndpoint: String = "http://jsonplaceholder.typicode.com/posts"
        
        let postsUrlRequest = NSMutableURLRequest(URL: NSURL(string: postsEndpoint)!)
        
        postsUrlRequest.HTTPMethod = "POST"
        
        let newPost: NSDictionary = ["title": "Frist Psot", "body": "I iz fisrt", "userId": 1];
        do {
            let jsonPost = try NSJSONSerialization.dataWithJSONObject(newPost, options: [])
            postsUrlRequest.HTTPBody = jsonPost
        } catch {
            print("Error: cannot create JSON from post")
        }
        
        let postTask = session.dataTaskWithRequest(postsUrlRequest, completionHandler: myCompletionHandler)
        
        postTask.resume()
        
        
        // DELETE
        
        let firstPostEndpoint: String = "http://jsonplaceholder.typicode.com/posts/1"
        
        let firstPostUrlRequest = NSMutableURLRequest(URL: NSURL(string: firstPostEndpoint)!)
        
        firstPostUrlRequest.HTTPMethod = "DELETE"
        
        let deleteTask = session.dataTaskWithRequest(firstPostUrlRequest, completionHandler: {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on /posts/1")
                return
            }
        })
        deleteTask.resume()
        
    }
    
    
    
    
}

