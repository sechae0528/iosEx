//
//  DetailViewController.swift
//  ExMasterDetail
//
//  Created by 스마트금융과29 on 2018. 5. 25..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel! // by hwy s2


    @IBOutlet weak var photoImageView: UIImageView!
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            } //by hwy s2
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
        title = "fireworks"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? { // by hwy s1
        didSet {
            // Update the view.
            configureView()
        }
    }


}

