//
//  ViewController.swift
//  FacebookWebbrowserDebugApp
//
//  Created by Will Laurance on 4/8/16.
//  Copyright © 2016 Will Laurance. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.register(defaults: ["UserAgent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBDV/iPhone9,3;FBMD/iPhone;FBSN/iOS;FBSV/13.3.1;FBSS/2;FBID/phone;FBLC/pl_PL;FBOP/5;FBCR/Play]"])

        
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.scalesPageToFit = true
        myWebView.contentMode = UIView.ContentMode.scaleAspectFit
        myWebView.delegate = self
        loadURLWithString(URLString: "https://google.com")

    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let zoom = webView.bounds.size.width / webView.scrollView.contentSize.width
        webView.scrollView.setZoomScale(zoom, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadURLWithString(URLString: String) {
        if let URL = NSURL(string: URLString) {
            if (URL.scheme != "") && (URL.host != nil) {
                loadURL(URL: URL)
            } else {
                loadURLWithString(URLString: "http://\(URLString)")
            }
        }
    }
    
    func loadURL(URL: NSURL, cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 0) {
        myWebView.loadRequest(NSURLRequest(url: URL as URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval) as URLRequest)
    }
    
    @IBAction func back(sender: AnyObject) {
        
    }
    
    @IBAction func forward(sender: AnyObject) {
        
    }


}

