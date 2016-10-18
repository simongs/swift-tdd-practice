//
//  Forecast.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 12..
//  Copyright © 2016년 simons. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}
