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
        
         let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("황원용3", forKey: "username")
        newUser.setValue("황원용1", forKey: "username")
        newUser.setValue("황원용", forKey: "username")
        newUser.setValue("비번", forKey: "password")
        
        do {
            
            try context.save()
            
            print("Saved")
            
        } catch {
            
            print("There was an error")
            
        }
        
        
        // 읽어오기
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "황원용")
        
        
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                        
                        
                        context.delete(result)
                        
                        do {
                            
                            try context.save()
                            
                        } catch {
                            
                            print("Delete failed")
                            
                        }
                        
                        /*
                        result.setValue("wonyong hwang", forKey: "username")
                        do {

                            try context.save()

                        } catch {

                            print("Rename failed")

                        }
                        */
                        
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

