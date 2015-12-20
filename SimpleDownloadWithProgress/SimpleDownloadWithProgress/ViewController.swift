//
//  ViewController.swift
//  SimpleDownloadWithProgress
//
//  Created by Phil Wright on 12/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate  {
    
    enum DownloadStatus {
        case Downloaded
        case DownloadInProgress
        case Canceled
        case DownloadError
        case None
        
        init() {
            self = .None
        }
        
        func statusAsString() -> String {
            switch self {
            case .Downloaded:
                return "Downloaded"
            case .DownloadInProgress:
                return "Download In Progress"
            case .Canceled:
                return "Canceled"
            case .DownloadError:
                return "Download Error"
            case .None:
                return "None"
            }
        }
    }
    
    var isDownloading = false
    
    let bookURL = NSURL(string: "http://scholar.princeton.edu/sites/default/files/oversize_pdf_test_0.pdf")
    
    var downloadTask: NSURLSessionDownloadTask?
    
    var backgroundSession: NSURLSession?
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var downloadButton: UIButton!
    
    var currentDownloadState : DownloadStatus = .None
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let sessionConfig = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.touchopia.backgroundsession")
        
        backgroundSession = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        progressView.setProgress(0.0, animated: false)
        
        updateUI(currentDownloadState)
    }
    
    func updateUI(downloadState: DownloadStatus) {
        
        self.statusLabel.text = downloadState.statusAsString()
        
        switch downloadState {
            
            case .Downloaded:
                currentDownloadState = .Downloaded
                downloadButton.setTitle("Start Downloading", forState: .Normal)
            
            case .Canceled:
                
                currentDownloadState = .Canceled
                downloadButton.setTitle("Start Downloading", forState: .Normal)
                
            case .DownloadError:
                
                currentDownloadState = .DownloadError
                downloadButton.setTitle("Try Downloading Again", forState: .Normal)
                
            case .DownloadInProgress:
                currentDownloadState = .DownloadInProgress
                downloadButton.setTitle("Pause Downloading", forState: .Normal)
                
            case .None:
                return
            }
    }
    
    @IBAction func startStopDownload() {
        
        if isDownloading == false {
            
            if let url = bookURL {
                isDownloading = true
                downloadTask = backgroundSession?.downloadTaskWithURL(url)
                downloadTask?.resume()
                
                updateUI(.DownloadInProgress)
            } else {
                updateUI(.Canceled)
                downloadTask?.cancel()
            }
            
        } else if isDownloading == true {
            
            isDownloading = false
            updateUI(.Canceled)
            downloadTask?.cancel()            
        }
    }
    
    func fileExists(fileString: String?) -> Bool {
        
        guard let fullPath = fileString else {
            print("fileString is empty")
            return false
        }
        return NSFileManager.defaultManager().fileExistsAtPath(fullPath)
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
        let destinationPath = NSURL(fileURLWithPath: getDocumentsFolder().stringByAppendingString("/file.pdf"))
        
        if self.fileExists(destinationPath.path!) {

            updateUI(.Downloaded)
            
            isDownloading = false
            
            downloadButton.setTitle("Start Downloading", forState: .Normal)
            
            print("found the file! \(destinationPath)")
        }
        else {
            do {
                try NSFileManager().moveItemAtURL(location, toURL: destinationPath)
                print("file moved from \(location) to \(destinationPath) successfully")
                
                currentDownloadState = .Downloaded
                isDownloading = false
                downloadButton.setTitle("Start Downloading", forState: .Normal)
                
            } catch {
                print("An error occurred while moving file")
            }
        }
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        progressLabel.text = String(format: "%0.0f", progress * 100) + "%"
        
        progressView.setProgress(progress, animated: true)
        
        updateUI(.DownloadInProgress)
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        
        print("Session Completed")
        
        // clear task
        downloadTask = nil
        
        // set progress to 0
        progressView.setProgress(0.0, animated: true)
        
        if error != nil {
            updateUI(.DownloadError)
            print(error?.description)
        }
        else {
            updateUI(.Downloaded)
            print("The file downloaded successfully")
        }
    }
    
    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession) {
        print("\n\nSession Finished\n\n")
    }
    
    // Helper function
    
    func getDocumentsFolder() -> String {
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
    }
}

