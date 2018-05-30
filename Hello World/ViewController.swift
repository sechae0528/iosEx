//
//  ViewController.swift
//  Hello World
//
//  Created by 스마트금융5 on 2018. 3. 7..
//  Copyright © 2018년 cse. All rights reserved.s
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mLabelText: UILabel!
   
    
    @IBAction func btnTouchUp(_ sender: Any) {
        mLabelText.text = "Hello World"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

