//
//  FirstViewController.swift
//  tabbedApp_cse
//
//  Created by 스마트금융5 on 2018. 5. 16..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    
    // AppDelegate에 접근할 수 있게 객체를 만든다.
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    //화면을 출력할 때 호출된다.(오버라이드 함수)
    override func viewWillAppear(_ animated: Bool) {
        //appDelegate 변수를 읽어서 화면(텍스트필드)에 표시
        m_dataTextField.text = String(ap.cmValue)
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
        // 사용자가 입력(버튼클릭시)시 텍스트필드 값을 appDelegete변수에 적용(업데이트)
        
        //키보드를 닫는다.
        m_dataTextField.resignFirstResponder()
        if let text = m_dataTextField.text{
            
            if let cmValue = Double(text){
                ap.cmValue = cmValue
            }
        }
    }
    
}

