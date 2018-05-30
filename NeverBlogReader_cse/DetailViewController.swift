//
//  DetailViewController.swift
//  NeverBlogReader_cse
//
//  Created by 스마트금융5 on 2018. 5. 30..
//  Copyright © 2018년 cse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var detailTextView: UITextView!
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.timestamp!.description
//            }
            self.title = detail.bloggerlink
            //if let label = detailLabel {
            //label.text = detail.timestamp!.description
            
            print(detail.blogdescription)
            //detailTextView.text = detail.description
            if let showTextView = self.detailTextView{
                showTextView.text = detail.blogdescription // detail.description as? String
                //detailTextView.text = detail.blogdescription
            }
            
            
            //}
            
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // detailLabel.text = "test"
        //detailTextView.text = "fffewfwefwefweffwefwefwe"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

