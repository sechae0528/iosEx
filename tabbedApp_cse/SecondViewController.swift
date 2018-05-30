//
//  SecondViewController.swift
//  tabbedApp_cse
//
//  Created by 스마트금융5 on 2018. 5. 16..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    
    // AppDelegate에 접근할 수 있게 객체를 만든다.
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    //화면을 출력할 때 호출된다.(오버라이드 함수)
    override func viewWillAppear(_ animated: Bool) {
        let inchValue = ap.cmValue * 0.3937
        m_dataTextField.text = String(inchValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClicked(_ sender: Any) {
        //키보드를 닫는다.
        m_dataTextField.resignFirstResponder()
        if let text = m_dataTextField.text{
            
            if let inchValue = Double(text){
                ap.cmValue = inchValue / 0.3937
            }
        }
    }
    
}

