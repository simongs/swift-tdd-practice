//
//  ViewController.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet var thumbnail: UIImageView!
    
    @IBOutlet var clickLabel: UILabel!
    
    @IBOutlet var inputArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters: Parameters = [
            "code": 0
        ]
        
        HttpClient.sharedInstance.getInstance().request("https://openapi.naver.com/v1/captcha/nkey", parameters : parameters)
            .responseJSON { response in
                
                debugPrint("key Data : \(response.data)")    // server data
                
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let key = json["key"].stringValue
                    
                    self.clickLabel.text = key;
                    self.load(key:key)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
        }
    }

    @IBAction func clickButton(_ sender: AnyObject) {
        let parameters: Parameters = [
            "code": 1,
            "key": clickLabel.text!,
            "value": inputArea.text!
        ]
        
        HttpClient.sharedInstance.getInstance().request("https://openapi.naver.com/v1/captcha/nkey", parameters : parameters)
            .responseJSON { response in
                
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                debugPrint(response.data)     // server data
                debugPrint(response.result)   // result of response serialization
                
        
            switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let result = json["result"].boolValue
                    
                    
                
                    if (result) {
                        self.clickLabel.text = "OK!!"
                    } else {
                        self.clickLabel.text = "땡!!"
                    }
                
                case .failure(let error):
                    print("Request failed with error: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func load(key:String) {
        let testurl = "https://openapi.naver.com/v1/captcha/ncaptcha.bin"
        
        let parameters: Parameters = [
            "key": key
        ]
        
        HttpClient.sharedInstance.getInstance().request(testurl, parameters : parameters).responseData { response in
            
            switch response.result {
                case .success(let data):
                    self.thumbnail.image = UIImage(data: data)
                
                case .failure(let error):
                    print("Request failed with error: \(error)")
            }
        }

    }

}

