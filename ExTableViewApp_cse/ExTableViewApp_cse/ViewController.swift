//
//  ViewController.swift
//  ExTableViewApp_cse
//
//  Created by 스마트금융5 on 2018. 5. 16..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let testArray = ["apple", "pear", "banana", "strawberry"]
    
    let testArray2 = ["사과", "배", "바나나", "딸기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //test라는 테이블을 재사용할 것이고, 없으면 찾아서 등록하겠다.
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "test")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "BetterTableViewCell")
        //cell.textLabel?.text = "테스트"
        
        print(indexPath.row)
        //cell.textLabel?.text =  testArray[indexPath.row]
        cell.textLabel?.text = String(indexPath.section) + ":" + testArray[indexPath.row]
        cell.detailTextLabel?.text = testArray2[indexPath.row]
        
        return cell
    }
    
    //섹션나누기(4번반복해라)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //머릿말 넣기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    //꼬릿말 넣기
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // https://stackoverflow.com/questions/25347406/uitableview-registerclass-with-swift
        // https://www.hackingwithswift.com/example-code/uikit/how-to-register-a-cell-for-uitableviewcell-reuse
        // https://medium.com/ios-seminar/why-we-use-dequeuereusablecellwithidentifier-ce7fd97cde8e
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

