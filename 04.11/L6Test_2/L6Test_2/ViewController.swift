//
//  ViewController.swift
//  L6Test_2
//
//  Created by 스마트금융과29 on 2018. 4. 10..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtn(_ sender: Any) {
        
        if let myurl = URL(string: "http://www.nate.com") {
            // url이 nil이 아니라면 SFSafariViewController를 출력
            let vc = SFSafariViewController(url: myurl)
            vc.delegate = self
            present(vc, animated: true, completion: myCallBack) // "Open with safari view controller", to see the content now being displayed inside a SFSafariViewController instance.
        }
        
    }
    
    func myCallBack(){
        print("call back called")
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Safari Close")
    }
    
    @IBAction func imgLoad(_ sender: Any) {
   
        // 이미지 출처 : https://pixabay.com/ko/
        let stringURL = "https://cdn.pixabay.com/photo/2016/11/30/12/29/vintage-1872682_1280.jpg"
        if let url = URL(string: stringURL) {
            // url이 nil이 아니라면 변환
            if let data = NSData(contentsOf: url) {
                // 변환된 data를 출력
                myImageView.image = UIImage(data: data as Data)
            }
        }
    }
    
    @IBAction func textLoad(_ sender: Any) {
        if let url = URL(string: "https://www.google.com/robots.txt") {
            // url이 nil이 아니라면 URLSession 객체 생성
            let urlSession = URLSession.shared
            // 데이터를 읽어들이는 태스크를 완료하면 completionHandler 처리가 수행됩니다.
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
    }
    
    // 읽어들이기를 완료했을 때 호출할 메서드 생성(이름은 자유)
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        // Raw 데이터를 UTF8 문자열로 변환
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
            // UTF8 문자열로 변환되면 일반적인 문자열로 변환
            let str = String(nsstr)
            // 문자열 출력
            print("문자열=[\(str)]")
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Success")
                    
                    // alert 사용법 : https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
                    let alert = UIAlertController(title: "결과", message: str, preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    print("Error")
                }
            }
        }
        
        
        
    }
}












