//
//  SecondViewController.swift
//  convertUnit
//
//  Created by 스마트금융과29 on 2017. 12. 28..
//  Copyright © 2017년 hwy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    // AppDelegate에 접근할 수 있게 객체를 만든다.
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    // 화면을 출력할 때 호출된다.(오버라이드 함수)
    override func viewWillAppear(_ animated: Bool) {
        let inchValue = ap.cmValue * 0.3937
        dataTextField.text = String(inchValue)
    }
    
    @IBAction func tabInput() {
        
        // 키보드를 닫는다.
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text{
            
            if let inchValue = Double(text){
                ap.cmValue = inchValue / 0.3937
            }
        }
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

