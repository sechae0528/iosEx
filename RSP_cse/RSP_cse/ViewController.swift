//
//  ViewController.swift
//  RSP_cse
//
//  Created by 스마트금융5 on 2018. 4. 4..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let randomSource = GKARC4RandomSource()

    
    @IBOutlet weak var computerImgView: UIImageView!
    
    @IBOutlet weak var playerImgView: UIImageView!
    
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBOutlet weak var labelMe: UILabel!
    
    @IBOutlet weak var labelCom: UILabel!
    
    @IBOutlet weak var verticalBarImg: UIImageView!
    var winCountMe:Int = 0
    var winCountCom:Int = 0
    
    @IBAction func tapScissors(_ sender: Any) {
        playerImgView.image = UIImage(named: "scissors.png")
        //doComputer(player: 0)
    }
    
    @IBAction func tapRock(_ sender: Any) {
        playerImgView.image = UIImage(named: "rock.png")
        //doComputer(player: 1)
        
    }
    
    @IBAction func tapPaper(_ sender: Any) {
        playerImgView.image = UIImage(named: "paper.png")
       // doComputer(player: 2)
    }
    
    func doComputer(player:Int) {
        // 0~2 범위의 랜덤 값을 구합니다.
        let computer = randomSource.nextInt(upperBound: 3)
        var msg = ""
        switch computer {
        case 0:
            // 가위
            computerImgView.image = UIImage(named: "scissors.png")
            switch player {
            case 0: // 가위
                msg = "비겼어요!"
            case 1: // 바위
                msg = "이겼어요....!"
                winCountMe += 1
            case 2: // 보
                msg = "졌어요ㅠㅁㅜ"
                winCountCom += 1
            default:
                break
            }
        case 1:
            // 바위
            computerImgView.image = UIImage(named: "rock.png")
            switch player {
            case 0: // 가위
                msg = "졌어요ㅠㅁㅜ"
                winCountCom += 1
            case 1: // 바위
                msg = "비겼어요!"
            case 2: // 보
                msg = "이겼어요....!"
                winCountMe += 1
            default:
                break
            }
        case 2:
            // 보
            computerImgView.image = UIImage(named: "paper.png")
            switch player {
            case 0: // 가위
                msg = "이겼어요....!"
                winCountMe += 1
            case 1: // 바위
                msg = "졌어요ㅠㅁㅜ"
                winCountCom += 1
            case 2: // 보
                msg = "비겼어요!"
            default:
                break
            }
        default:
            break
        }
        
        msgLabel.text = msg
        
        result()
    }
    
    
    @IBAction func tapStart(_ sender: Any) {
        // 이미지 뷰에 바위를 출력합니다.
        computerImgView.image = UIImage(named: "rock.png")
        playerImgView.image = UIImage(named: "rock.png")
        // 레이블에 "가위 바위...."를 출력합니다.
        msgLabel.text = "가위 바위...."
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // https://www.hackingwithswift.com/example-code/uikit/how-to-scale-stretch-move-and-rotate-uiviews-using-cgaffinetransform
        // 180도의 라디안을 구합니다.
        let angle:CGFloat = CGFloat((180.0 * Double.pi) / 180.0)
        
        print("radian angle = ", angle)
        // 이미지 뷰를 회전시킵니다.
        computerImgView.transform = CGAffineTransform(rotationAngle: angle)
        
        
        
        let angle2:CGFloat = CGFloat((90.0 * Double.pi) / 180.0)
        
        print("radian angle = ", angle2)
        
        verticalBarImg.transform = CGAffineTransform(rotationAngle:angle2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func result(){
        
        labelMe.text = String(winCountMe)
        labelCom.text = String(winCountCom)
    }


}

