//
//  ViewController.swift
//  4강테스트
//
//  Created by 스마트금융과29 on 2018. 3. 27..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTextField.text = "안녕하세요!"
        myTextField.placeholder = "여기에 입력해주세요!"
        myTextField.textColor = UIColor.blue
        myTextField.backgroundColor = UIColor.cyan
        myTextField.textAlignment = NSTextAlignment.center
        // myTextField.font = UIFont.systemFont(ofSize: 24)
        myTextField.keyboardType = UIKeyboardType.emailAddress
        myTextField.returnKeyType = UIReturnKeyType.done
        
        
        myTextView.text = "안녕하세요!"
        myTextView.textColor = UIColor.blue
        myTextView.backgroundColor = UIColor.cyan
        myTextView.textAlignment = NSTextAlignment.right
        myTextView.font = UIFont(name: "AmericanTypewriter", size: 20)
        myTextView.isEditable = true
        myTextView.keyboardType = UIKeyboardType.URL
        myTextView.returnKeyType = UIReturnKeyType.send
        
        myImageView.image = UIImage(named: "fintech.jpg")
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
    }

    @IBAction func touchDownBtn(_ sender: Any) {
        myButton.setTitle("눌러주세요", for: UIControlState.normal)
        myButton.isEnabled = true
        myButton.isSelected = true
    }
    @IBAction func tapBtn(_ sender: Any) {
        
        //  comment는 해당 문구가 사용되는 위치나 의미 혹은 목적 등을 설명해줄 수 있는 부가적인 텍스트인데, 있으나 없으나 앱의 동작에는 전혀 영향을 주지 않는 부분이다.
        
        myLabel.text = NSLocalizedString("HelloHe1lloHelloHelloHell2oHelloHello3HelloHelloHel4loHello5HelloHello", comment:"")
        
        myLabel.textColor = UIColor.blue
        myLabel.backgroundColor = UIColor.cyan
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.font = UIFont.systemFont(ofSize: 20)
        
        //  this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
        myLabel.numberOfLines = 1
        
    }
    @IBAction func switchChanged(_ sender: Any) {
        mySwitch.isOn = true
        mySwitch.onTintColor = UIColor.red
        mySwitch.thumbTintColor = UIColor.yellow
        
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        //mySlider.value = 20
        mySlider.minimumTrackTintColor = UIColor.blue
        mySlider.maximumTrackTintColor = UIColor.red
        mySlider.isContinuous = false
        //print(mySlider.value)
    }
    
    @IBAction func textFieldEditingEnd(_ sender: Any) {
        
        print("텍스트필드 입력 종료")
        //print(myTextField.text)
        
    }
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        print("Close Button clicked")
        
        // alert 사용법 : https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
//        let alert = UIAlertController(title: "My Title", message: myTextView.text, preferredStyle: UIAlertControllerStyle.alert)
//
//        // add an action (button)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//        // show the alert
//        self.present(alert, animated: true, completion: nil)
        
        
        myTextView.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }


}

