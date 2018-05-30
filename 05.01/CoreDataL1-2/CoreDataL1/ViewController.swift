//
//  ViewController.swift
//  CoreDataL1
//
//  Created by 스마트금융과29 on 2018. 4. 30..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 저장하기
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
         // access core data by manageable variable
         let context = appDelegate.persistentContainer.viewContext
        
         //let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        

        do{
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("황원용1234", forKey: "username")
        newUser.setValue("비번1234", forKey: "password")
        try context.save()
        }catch {
            
            print("There was an error")
            
        }
        
        do{
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("황원용5678", forKey: "username")
        newUser.setValue("비번5678", forKey: "password")
        try context.save()
        }catch {
            
            print("There was an error")
            
        }
        
        do{
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("황원용9012", forKey: "username")
        newUser.setValue("비번9012", forKey: "password")
         try context.save()
        }catch {
            
            print("There was an error")
            
        }
        
        
        // 읽어오기
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "황원용1234")
        

        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                        
                        
                        /*
                        context.delete(result)

                        do {

                            try context.save()

                        } catch {

                            print("Delete failed")

                        }
                        */
                        /*
                        result.setValue("wonyong hwang", forKey: "username")
                        do {

                            try context.save()

                        } catch {

                            print("Rename failed")

                        }
                        */
                        
                    }
                    
                    if let pwd = result.value(forKey: "password") as? String {
                        
                        print(pwd)
                    }
                    
                    
                    
                }
                
                
            } else {
                
                print("No results")
                
            }
            
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        
        
        
        
        
        // 읽어오기 contains
        //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1
        print("----------------------------------------------------------------")
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        var attributeName  = "username"
        var attributeValue = "황원용"
        //NSPredicate predicate   = [NSPredicate predicateWithFormat:@"%K like %@",attributeName, attributeValue]
        
        request2.predicate = NSPredicate(format: "%K CONTAINS %@", attributeName, attributeValue)
        
        
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
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

