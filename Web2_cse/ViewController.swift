//
//  ViewController.swift
//  Web2_cse
//
//  Created by 스마트금융5 on 2018. 4. 11..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var myImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtnSafari(_ sender: Any) {
        print("호출되었습니다.")
        if let myurl = URL(string: "http://www.nate.com"){
            //url이 nil이 아니라면 SFSafariViewController를 출력
            let vc = SFSafariViewController(url: myurl)
            vc.delegate = self
            present(vc, animated: true, completion: myCallBack)
            //"Open with safari view controller", to see the content now being displayed inside a SFSafariViewController instance.
        }
    }
  
    func myCallBack()  {
        print("사파리 브라우저가 열렸습니다.")
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("사파리 브라우저가 닫혔습니다.")
    }
    
    
    @IBAction func imgLoadingBtn(_ sender: Any) {
        //이미지 출처 : https://pixabay.com/ko/
        let stringURL = "https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529_1280.jpg"
        if let url = URL(string: stringURL){
            //url이 nil이 아니라면 변환
            //변환된 data를 출력
            if let data = NSData(contentsOf: url){
                myImgView.image = UIImage(data: data as Data)
            }
        }
        
        
    }
    
    @IBAction func btnTextLoad(_ sender: Any) {
        //1. URL -> request ------ Server ----> Response (text file : .txt)
        if let url = URL(string: "https://www.google.com/robots.txt"){
            //url이 nil 이 아니라면 URLSession 객체 생성
            let urlSession = URLSession.shared
            // 데이터를 읽어들이는 테스크를 완료하면 completionHandler 처리가 수행됩니다.
            let tesk = urlSession.dataTask(with: url, completionHandler: onFinish)
            tesk.resume() //request -> --- Server ---> response : onFinish
        }
        //2. response -> var text:String -> alert popup

        
    }
  
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        //Raw 데이터를 UTF8 문자열로 변환
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
            //UTF8 문자열로 변환되면 일반적인 문자열로 변환
            let str = String(nsstr)
            //문자열 출력
            print("문자열=[\(str)]")
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Success")
                    
                    //alert 사용법 : http://stackoverflow.com/question/24022479/how-would-i-create-a-uialertview-in-swift
                    let alert = UIAlertController(title: "결과", message: str, preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion:  nil)
                }else {
                    print("Error" + "\(response.statusCode)")
                }
            }
        }
    }
    
    
    
}

