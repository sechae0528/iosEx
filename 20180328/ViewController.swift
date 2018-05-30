//
//  ViewController.swift
//  20180328
//
//  Created by 스마트금융5 on 2018. 3. 28..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var m_switch : Bool = true
    
   
    @IBOutlet weak var m_myTextView: UITextView!
    @IBOutlet weak var m_myTextField: UITextField!
    @IBOutlet weak var m_mySlider: UISlider!
    @IBOutlet weak var m_myButton: UIButton!
    @IBOutlet weak var m_Label: UILabel!
    @IBOutlet weak var m_mySwitch: UISwitch!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //m_myTextField.text = "안녕하세요!"
        m_myTextField.placeholder = "여기에 입력해주세요!"//
        m_myTextField.textColor = UIColor.blue
        m_myTextField.backgroundColor = UIColor.cyan
        m_myTextField.textAlignment = NSTextAlignment.center
        // m_myTextField.font = UIFont.systemFont(ofSize: 24)
        m_myTextField.keyboardType = UIKeyboardType.emailAddress//
        m_myTextField.returnKeyType = UIReturnKeyType.done
        
        
        m_myTextView.text = "안녕하세요!"
        m_myTextView.textColor = UIColor.blue
        m_myTextView.backgroundColor = UIColor.cyan
        m_myTextView.textAlignment = NSTextAlignment.right
        m_myTextView.font = UIFont(name: "AmericanTypewriter", size: 20)
        m_myTextView.isEditable = true
        m_myTextView.keyboardType = UIKeyboardType.URL
        m_myTextView.returnKeyType = UIReturnKeyType.send
        
        myImageView.image = UIImage(named: "fintech.jpg")
        myImageView.contentMode = UIViewContentMode.scaleAspectFit//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func m_touchUp(_ sender: Any) {
        m_Label.text = "hello"
        
        m_myButton.setTitle("눌러라", for: UIControlState.normal)
        m_myButton.isEnabled = true
        m_myButton.isSelected = true
        
        m_Label.text = NSLocalizedString("hello", comment: "인사말")
        m_Label.textColor = UIColor.blue
        m_Label.backgroundColor = UIColor.cyan
        m_Label.textAlignment = NSTextAlignment.center
        
        m_Label.font = UIFont.systemFont(ofSize : 15)
        m_Label.numberOfLines = 0
        //최대 몇줄로 표시할 수 있는지? 0으로하면 제한없이 늘어난다.
        
    }
    
    @IBAction func funcSwitchChanged(_ sender: Any) {
//        m_mySwitch.isOn = true
//        m_mySwitch.onTintColor = UIColor.darkGray
//        m_mySwitch.thumbTintColor = UIColor.purple
        if(m_mySwitch.isOn == true){ //isOn = true 일때가 열리는 기능
           
            m_mySwitch.onTintColor = UIColor.darkGray
            m_mySwitch.thumbTintColor = UIColor.purple
         
        }else{ //isOn = false 일때가 닫히는 기능
            m_mySwitch.thumbTintColor = UIColor.brown
            m_mySwitch.onTintColor = UIColor.blue
          
        }
        
    }
    @IBAction func mySliderChanged(_ sender: Any) {
        m_mySlider.minimumValue = 0
        m_mySlider.maximumValue = 100
        //mySlider.value = 20
        m_mySlider.minimumTrackTintColor = UIColor.blue
        m_mySlider.maximumTrackTintColor = UIColor.red
        m_mySlider.isContinuous = true
        print(m_mySlider.value)
        
    }
    
//    @IBAction func vc(_ sender: Any) {
//        if( == done )
//        {
//
//            text..
//        }
//    }
    @IBAction func textFieldEditingEnd(_ sender: Any) {
        print("텍스트필드 입력 종료")
        //print(m_myTextField.text)
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        print("Close Button clicked")
        
//        // alert 사용법 : https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
//                let alert = UIAlertController(title: "My Title", message: m_myTextView.text, preferredStyle: UIAlertControllerStyle.alert)
//
//                // add an action (button)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//                // show the alert
//                self.present(alert, animated: true, completion: nil)
//
//
        m_myTextView.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        m_myTextField.resignFirstResponder()
        m_myTextView.resignFirstResponder()
    }
    
}

