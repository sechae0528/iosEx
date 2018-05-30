//
//  ViewController.swift
//  NaverBlogCore_cse
//
//  Created by 스마트금융5 on 2018. 5. 4..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    
    //검색 후 정보를 가져올 주소// 1. Naver Open API URL -> String
    let urlToRequest = "https://openapi.naver.com/v1/search/blog?query="
    
    var timer:Timer?
    var count = 0
    var stopCounter:Bool = false
    
    var retStr3:String = ""
    
    
    @IBAction func textFieldEnterKey(_ sender: Any) {
        
       // let now = NSDate()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        currDate.text = dateFormatter.stringFromDate(now)
        //let tempData1 = myTextField.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Keyword")
        
        do {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Keyword", into: context)
            newUser.setValue(myTextField.text, forKey: "keyword")
            newUser.setValue("Corea", forKey: "password")
            try context.save()
            
            print("CoreData Saved")
            
        } catch {
            
            print("There was an error")
            
        }
        
        do {
            
            let results = try context.fetch(request1)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let keyword = result.value(forKey: "keyword") as? String {
                        
                        print(keyword)
                        
                    }
//                    if let date = result.value(forKey: "date") as? String {
//
//                        print(date)
//                    }
                    
                }
                
                
            } else {
                
                print("No results")
                
            }
            
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        
        
        dataRequest()
    }
    
    
    
    func dataRequest() {
        //Naver Open API 호출
        // 0. 사용자가 입력한 검색어를 받아온다.
        // 1. Naver Open API URL -> String
        // 2. ID, Secret(네이버 발급) -> HTTP Header
        // 3. 1+2 -> GET 방식으로 HTTP호출
        // 4. Naver서버 -> 응답(response)
        // 5. 응답 -> Parsing(내가 원하는 데이터를 추출)
        // 6. TextView 디스플레이
        
        
        // let tempData = "한국폴리텍대학교"
        // URL 인코딩 ex> 한국폴리텍 대학 -> %ED%99~~~
        let tempData = myTextField.text
        let encodingQuery = tempData!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        //내가 입력한 값과 정보를 가져올 사이트주소를 가져옴
        // myUrl = URL(https://openapi.naver.com/v1/search/blog?query=%ED%99~~~)
        let myUrl = URL(string: (urlToRequest + encodingQuery!))!
        
        //HTTP 통신시 세션을 공유한다.
        let session4 = URLSession.shared
        
        //HTTP Request 객체를 만든다.
        let request = NSMutableURLRequest(url: myUrl)
        
        //request.httpMethod = "POST" // POST 방식인 경우
        request.httpMethod = "GET" // GET 방식인 경우
        
        //ID, Secret 설정 -> HTTP 헤더에 설정
        request.setValue(" CJki3_MfJgnCJbjcokve", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("oLiHv9Ur3v", forHTTPHeaderField: "X-Naver-Client-Secret")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData //캐시 사용안함
        
        let taskTest = session4.dataTask(with: request as URLRequest, completionHandler: onFinish)
        
        //같은 패턴
        //        let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in
        //            guard let _: Data = data, let _: URLResponse = response, error == nil else {
        //                print("*****error")
        //                return
        //            }
        
        taskTest.resume()
        
    }
    
    
    // POST 일 경우 아래 코드 형태로 HTTP Body 구성
    //let paramString = "data=Hello"
    //request.httpBody = paramString.data(using: String.Encoding.utf8)
    
    func onFinish(data: Data?, response: URLResponse?, error: Error?){
        //   print(data)
        do{
            let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            // JSON -> NSDictionary {key : value, key:value, key:value }
            
            // print("----------------------딕셔너리 변환-------------------")
            print(array) //dictionary key:value  예> apple:사고
            
            
            //print("---------------------KEY가item인 Value를 추출-------------------")
            print(array["items"]!) //array["key"] = "value"
            
            // {key : value, key:value, key:value } --------> ["value","value",.....10items]
            let temp = array["items"] as! NSArray // 배열로 변환
            
            print("---------------------배열의 크기는 -------------------")
            print(temp.count) // ["value","value",.....10items]
            
            print(temp[0])
            
            
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
            
            //타이머를 이용한 비동기 처리방식을 xcode에서 지원하는 DispatchQueue 이용해 UI Main Thread가 아닌 곳에서 디스플레이를 업데이트하도록 변경!!
            DispatchQueue.main.sync(execute: {
                
                self.myTextView.text = retStr3
                
            })
            
        } catch {
            print ("JSON Parsing Error")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        //let newUser1 = NSEntityDescription.insertNewObject(forEntityName: "Keyword", into: context)
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Keyword")
        
        request2.predicate = NSPredicate(format: "password = %@", "Corea")
        
        do {
            
            let results = try context.fetch(request2)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let keyword = result.value(forKey: "keyword") as? String {
                        
                        myTextField.text = keyword
                        print("사용자 이전 입력값 \(keyword)")
                        
                        let tempData = myTextField.text
                        
                        let encodingQuery = tempData!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
                        //내가 입력한 값과 정보를 가져올 사이트주소를 가져옴
                        // myUrl = URL(https://openapi.naver.com/v1/search/blog?query=%ED%99~~~)
                        let myUrl = URL(string: (urlToRequest + encodingQuery!))!

                        //HTTP 통신시 세션을 공유한다.
                        let session4 = URLSession.shared

                        //HTTP Request 객체를 만든다.
                        let request3 = NSMutableURLRequest(url: myUrl)

                        //request.httpMethod = "POST" // POST 방식인 경우
                        request3.httpMethod = "GET" // GET 방식인 경우

                        //ID, Secret 설정 -> HTTP 헤더에 설정
                        request3.setValue(" CJki3_MfJgnCJbjcokve", forHTTPHeaderField: "X-Naver-Client-Id")
                        request3.setValue("oLiHv9Ur3v", forHTTPHeaderField: "X-Naver-Client-Secret")
                        request3.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData //캐시 사용안함

                        let taskTest = session4.dataTask(with: request3 as URLRequest, completionHandler: onFinish)

                        taskTest.resume()

                        
                    }
                    
                }
                
            } else {
                
                print("No results")
                
            }
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

