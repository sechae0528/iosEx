//
//  ColorViewController.swift
//  dispColor_cse
//
//  Created by 스마트금융5 on 2018. 5. 1..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import GameplayKit

class ColorViewController: UIViewController {
    
    let randomSource = GKARC4RandomSource()
    var colorR = 0
    var colorG = 0
    var colorB = 0
    var colorRed = 0
    var colorGreen = 0
    var colorBlue = 0
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 변경될 화면을 추출
        if let nextvc1 = segue.destination as? ColorViewController1 {
        
        // 변경될 화면에 있는 변수에 값을 전달
        nextvc1.colorRed = colorR
        nextvc1.colorGreen = colorG
        nextvc1.colorBlue = colorB
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        colorR = randomSource.nextInt(upperBound: 256)
        colorG = randomSource.nextInt(upperBound: 256)
        colorB = randomSource.nextInt(upperBound: 256)
        let backColor = UIColor(red: CGFloat(colorRed) / 256.0, green: CGFloat(colorGreen) / 256.0, blue: CGFloat(colorBlue) / 256.0, alpha: 1.0)
        view.backgroundColor = backColor
    }
    
    @IBAction func returnMain1(segue: UIStoryboardSegue){
        print("Returned2")
    }

   
}
