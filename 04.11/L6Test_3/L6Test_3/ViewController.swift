//
//  ViewController.swift
//  L6Test_3
//
//  Created by 스마트금융과29 on 2018. 4. 10..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, UITextFieldDelegate */{

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    let urlToRequest = "https://openapi.naver.com/v1/search/blog?query="
    
    var retStr1:String = ""
    var retStr2:String = ""
    var timer:Timer?
    var count = 0
    var stopCounter:Bool = false
    
    var retStr3:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.myTextField.delegate = self
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        //textField code
//
//        textField.resignFirstResponder()  //if desired
//        performAction()
//        return true
//    }
    
//    func performAction() {
//        //action events
////        dataRequest()
////        startTimer()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldEnter(_ sender: Any) {
//        dataRequest()
//        startTimer()
    }
    
    @IBAction func textFieldEnterKey(_ sender: Any) {
        dataRequest()
        startTimer()
    }
    func dataRequest() {
       // let tempData = "한국폴리텍대학교"
        let tempData = myTextField.text
        let encodingQuery = tempData!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let myUrl = URL(string: (urlToRequest + encodingQuery!))!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: myUrl)
        
        //request.httpMethod = "POST" // POST 방식인 경우
        request.httpMethod = "GET" // GET 방식인 경우
        
        request.setValue("NtF6I1bYeQpw1Z_V_gH0", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("o_tA7AtX2a", forHTTPHeaderField: "X-Naver-Client-Secret")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        // POST 일 경우 아래 코드 형태로 HTTP Body 구성
        //let paramString = "data=Hello"
        //request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        
        
        let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let _: Data = data, let _: URLResponse = response, error == nil else {
                print("*****error")
                return
            }
            
            // 응답받은 데이터를 단순 문자열로 처리할 경우 아래와 같이 처리함
            // let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("----------------------데이터 수신-------------------")
            print(data!)
           
            do{
                let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                print("----------------------딕셔너리 변환-------------------")
                print(array)
                

                print("---------------------KEY가item인 Value를 추출-------------------")
                print(array["items"]!)
                
                
                let temp = array["items"] as! NSArray // 배열로 변환
                print("---------------------배열의 크기는 -------------------")
                print(temp.count)
                
                
               
                
                
                print(temp[0])
                
//                let tempArray = temp[0] as! NSDictionary
//                print(tempArray["bloggerlink"]!)
//                self.retStr1 = tempArray["bloggerlink"] as! String
//                self.retStr2 = tempArray["bloggername"] as! String
                
                self.retStr3.removeAll()
                for i in 0..<temp.count{
                    var tempArray2 = temp[i] as! NSDictionary
                    self.retStr3.append("순번 : \(i)")
                    self.retStr3.append("\n")
                    self.retStr3.append("블로거네임 : ")
                    self.retStr3.append(tempArray2["bloggername"] as! String)
                    self.retStr3.append("\n")
                    self.retStr3.append("블로거링크 : ")
                    self.retStr3.append(tempArray2["bloggerlink"] as! String)
                    self.retStr3.append("\n")
                    self.retStr3.append("-----------------")
                    self.retStr3.append("\n")
                }
                
                
            } catch {
                print ("JSON Parsing Error")
            }
            
            

        }
        task.resume()
        
        return
    }
    
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        stopCounter = false
    }
    
    @objc func update(){
        
        print("update")
        
        
        if(count > 10 || stopCounter == true){
            self.stopTimer()
        }
        
        if /* retStr1 != "" || retStr2 != "" || */  retStr3 != "" {
//            myTextView.text = retStr1
//            myTextView.text.append("\n")
//            myTextView.text.append(retStr2)
            
             myTextView.text = retStr3
             stopCounter = true
        } else {
            count += 1
        }
        
    }
    
    func stopTimer(){
        self.timer?.invalidate()
        self.timer = nil
    }
}

