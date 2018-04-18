//
//  ViewController.swift
//  cse_web
//
//  Created by 스마트금융5 on 2018. 4. 11..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView1: UIWebView!
    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url:myURL!)
        myWebView.load(myRequest)
        
        if let url = URL(string: "http://www.nate.com"){
            let urlreq = URLRequest(url:url)
            myWebView1.loadRequest(urlreq)
        }
    }
    
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

