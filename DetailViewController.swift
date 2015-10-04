//
//  DetailViewController.swift
//  GatorFeed
//
//  Created by Calvin Nisbet on 2015-10-03.
//  Copyright © 2015 Lone Pine Creative. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var datePublished: UIBarButtonItem!
    
    var tutorialURL: NSURL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.hidden = true
        toolbar.hidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: tutorialURL)
            webView.loadRequest(request)
            
            if webView.hidden {
                webView.hidden = false
                toolbar.hidden = false
            }
            
        }
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
    
    
    
    @IBAction func showDatePublished(sender: AnyObject) {
        
    }
    

}
