//
//  ViewController.swift
//  L6Test
//
//  Created by 스마트금융과29 on 2018. 4. 10..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var depWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
        
       
        if let url = URL(string: "http://www.nate.com") {
            // url이 nil이 아니라면 출력합니다.
            let urlreq = URLRequest(url: url)
            depWebView.loadRequest(urlreq)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

