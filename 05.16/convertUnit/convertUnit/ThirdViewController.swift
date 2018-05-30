//
//  ThirdViewController.swift
//  convertUnit
//
//  Created by 스마트금융과29 on 2017. 12. 28..
//  Copyright © 2017년 hwy. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // AppDelegate에 접근할 수 있게 객체를 만든다.
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    // 화면을 출력할 때 호출된다.(오버라이드 함수)
    override func viewWillAppear(_ animated: Bool) {
        let sunValue = ap.cmValue * 0.33
        dataTextField.text = String(sunValue)
    }
    
    @IBAction func tabInput() {
        
        // 키보드를 닫는다.
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text{
            
            if let sunValue = Double(text){
                ap.cmValue = sunValue / 0.33
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
