//
//  ViewController.swift
//  SimpleUploadImage
//
//  Created by Phil Wright on 1/9/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSURLSessionTaskDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func uploadTapped() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imgView.image =  image
            imgView.backgroundColor = UIColor.clearColor()
            self.dismissViewControllerAnimated(true, completion: nil)
            uploadImage()
        }
    }
    
    func uploadImage() {
        
        guard let image = imgView.image,
            let data = UIImageJPEGRepresentation(image, 1) else {
                print("An error occurred with the image")
                return
        }
        
        guard let url = NSURL(string:"http://www.example.com") else {
            print("url is nil")
            return
        }
        
        self.uploadButton.enabled = false
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let task = session.uploadTaskWithRequest(request, fromData: data)
        task.resume()
    }
    

    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        
        self.uploadButton.enabled = true
        
        let alert = UIAlertController(title: "Title", message: error?.localizedDescription, preferredStyle: .Alert)
        
        self.presentViewController(alert, animated: false, completion: nil)
        
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        
        let uploadProgress:Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        progressView.progress = uploadProgress
        let progressPercent = Int(uploadProgress*100)
        progressLabel.text = "\(progressPercent)%"
    }
    
    func URLSession(session: NSURLSession,
        dataTask: NSURLSessionDataTask,
        didReceiveResponse response: NSURLResponse,
        completionHandler: (NSURLSessionResponseDisposition) -> Void) {
            self.uploadButton.enabled = true
    }
}


