//
//  ViewController.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var thumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        thumbnail.image = UIImage(named: "/Users/simons/avatar.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. test
    }

}

