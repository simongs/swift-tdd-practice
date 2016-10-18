//
//  CaptchaKey.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 13..
//  Copyright © 2016년 simons. All rights reserved.
//

import Foundation
import ObjectMapper

class CaptchaKey:Mappable {
    var key: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        key <- map["key"]
    }
    
}
