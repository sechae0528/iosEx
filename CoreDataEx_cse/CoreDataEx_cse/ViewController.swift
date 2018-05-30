//
//  ViewController.swift
//  CoreDataEx_cse
//
//  Created by 스마트금융5 on 2018. 5. 4..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //주로 변수초기화 사용
        
        // 저장하기 [START] ---------------------------------------------------------------
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        // access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext
        
        do{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue("채성은1234", forKey: "username")
            newUser.setValue("비번1234", forKey: "password")
            try context.save()
        }catch {
            
            print("There was an error")
            
        }
        
        do{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue("채성은5678", forKey: "username")
            newUser.setValue("비번5678", forKey: "password")
            try context.save()
        }catch {
            
            print("There was an error")
            
        }
        
        do{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue("채성은9012", forKey: "username")
            newUser.setValue("비번9012", forKey: "password")
            try context.save()
        }catch {
            
            print("There was an error")
            
        }
        // 저장하기 [END] -------------------------------------------------------------------
        
        // 읽어오기 [START] -----------------------------------------------------------------
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // request.returnsObjectsAsFaults = false
        
        //특정 문자에 대한 것만 찾고 싶을 때 사용
        request.predicate = NSPredicate(format: "username = %@", "채성은")
        //select * from UserData where username = "채성은"
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                    }
                    
                    if let password = result.value(forKey: "password") as? String {
                        
                        print(password)
                    }
                    
                    // 업데이트 [START] -------------------------------------------------------------
                    /*
                    result.setValue("sungeun chae", forKey: "username")
                    do {
                        try context.save()


                    } catch {

                        print("Rename failed")
                    }
                    */
                    // 업데이트 [END] ----------------------------------------------------------------
                    
                    
                    // 지우기 [START] ----------------------------------------------------------------
                    /*
                    context.delete(result)

                    do {
                        try context.save() //commit
                    } catch {
                        print("Delete failed")
                    }
                    */
                    // 지우기 [END] -------------------------------------------------------------------
                }
                
                
            } else {
                
                print("No results")
                
            }
            
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        // 읽어오기 [END] -------------------------------------------------------------
        
        // Predicate 응용 [START] -------------------------------------------------------------
        
        // 읽어오기 contains
        //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1
        print("-------------------------------------------------------")
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        var attributeName  = "username"
        var attributeValue = "채성은"
        //NSPredicate predicate   = [NSPredicate predicateWithFormat:@"%K like %@",attributeName, attributeValue]
        
        request2.predicate = NSPredicate(format: "%K CONTAINS %@", attributeName, attributeValue)
        // select * from Users where username like '%채성은%'
        
        
        do {
            
            let results = try context.fetch(request2)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                    }
                    if let pwd = result.value(forKey: "password") as? String {
                        
                        print(pwd)
                    }
                }
            }
        }catch {
            
            print("Couldn't fetch results111")
            
        }
        
                        
        
        
        
        
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //주로 화면 처리 (초기화면)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

