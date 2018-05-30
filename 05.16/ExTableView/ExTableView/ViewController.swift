//
//  ViewController.swift
//  ExTableView
//
//  Created by 스마트금융과29 on 2018. 5. 15..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var myTableView: UITableView!
    
    // 7
    let testArray = ["apple", "pear", "banana", "strawberry"]
    
    // 12
    let testArray2 = ["사과", "배", "바나나", "딸기"]
    
    // 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        print("tableView numberOfRowsInSection")
        
        
        // return 5
        
        // 8
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        print("tableView cellForRowAt")
        
        
        
        // 4
        //let cell = UITableViewCell(style: .default, reuseIdentifier:"TestCell")
    
        // 11
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier:"TestCell")
        
        // 5
        //cell.textLabel?.text = "테스트"
        //print(indexPath.row)
        
        // 6
        //cell.textLabel?.text =  testArray[indexPath.row]

        // 12
        cell.textLabel?.text = String(indexPath.section) + ":" + testArray[indexPath.row]
        cell.detailTextLabel?.text = testArray2[indexPath.row]
        
        
        return cell
    }
    
    // 9
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // 10
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3
        // https://stackoverflow.com/questions/25347406/uitableview-registerclass-with-swift
        // https://www.hackingwithswift.com/example-code/uikit/how-to-register-a-cell-for-uitableviewcell-reuse
        // https://medium.com/ios-seminar/why-we-use-dequeuereusablecellwithidentifier-ce7fd97cde8e
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TestCell")
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

