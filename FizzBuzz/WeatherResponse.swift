//
//  WeatherResponse.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 12..
//  Copyright © 2016년 simons. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}
