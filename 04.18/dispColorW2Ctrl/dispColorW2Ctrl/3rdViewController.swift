//
//  3rdViewController.swift
//  dispColorW2Ctrl
//
//  Created by 스마트금융과29 on 2018. 4. 17..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class _rdViewController: UIViewController {

    var colorRed = 0
    var colorGreen = 0
    var colorBlue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backColor = UIColor(red: CGFloat(colorRed) / 256.0, green: CGFloat(colorGreen) / 256.0, blue: CGFloat(colorBlue) / 256.0, alpha: 1.0)
        view.backgroundColor = backColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
