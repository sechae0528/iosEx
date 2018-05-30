//
//  ViewController.swift
//  dispColorW2Ctrl
//
//  Created by 스마트금융과29 on 2018. 4. 17..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    let randomSource = GKARC4RandomSource()
    var colorR = 0
    var colorG = 0
    var colorB = 0
    
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        colorR = randomSource.nextInt(upperBound: 256)
        colorG = randomSource.nextInt(upperBound: 256)
        colorB = randomSource.nextInt(upperBound: 256)
        
        // 레이블에 3개의 값을 출력
        colorLabel.text = "R=\(colorR), G=\(colorG), B=\(colorB)"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 변경될 화면을 추출
        let nextvc = segue.destination as! ColorViewController
        
        // 변경될 화면에 있는 변수에 값을 전달
        nextvc.colorRed = colorR
        nextvc.colorGreen = colorG
        nextvc.colorBlue = colorB
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnMain(segue: UIStoryboardSegue){
        
    }
}

