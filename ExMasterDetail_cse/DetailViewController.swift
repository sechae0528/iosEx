//
//  DetailViewController.swift
//  ExMasterDetail_cse
//
//  Created by 스마트금융5 on 2018. 5. 30..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

   // @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var photoImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }
            
            //detail을 통해 받아 온 파일명(fireworks001)에 .jpg를 부여서 UIImage객체를 만들어서
            //UIImageView 컴포넌트에 전달하면 된다.
            if let imageView = photoImageView{
                let fileName = "\(detail).jpg"
                imageView.image = UIImage(named: fileName)
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        title = "불꽃놀이라능"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? { //NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

