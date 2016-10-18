//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {
    
    let brain = Brain()
    
    func testIsDiviaibleByThree() {
        let result = brain.isDivisibleByThree(number: 3);
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = brain.isDivisibleByThree(number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testInDivisibleByFive() {
        let result = brain.isDivisibleByFive(number: 5)
        XCTAssertEqual(result, true)
    }
    
    func testSayFizz() {
        let result = brain.check(number: 3)
        XCTAssertEqual(result, "Fizz")
    }
    
    func testSayFizzBuzz() {
        let result = brain.check(number: 15)
        XCTAssertEqual(result, "FizzBuzz")
    }
    
    func testSayNormaValue() {
        let result = brain.check(number: 1)
        XCTAssertEqual(result, "1");
    }
    
    func testBasicHttpExample() {
        
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        print("starting")
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            debugPrint(response.data)     // server data
            debugPrint(response.result)   // result of response serialization
            
            ex.fulfill()
            
            if let JSON = response.result.value {
                debugPrint("JSON: \(JSON)")
            }
        }
        
        print("ending")
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testNaverAPI() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        var defaultHeaders = SessionManager.defaultHTTPHeaders
        defaultHeaders["X-Naver-Client-Id"] = "AoO5aDFVlQ7eAfKWkWNA"
        defaultHeaders["X-Naver-Client-Secret"] = "s87HwTaG9i"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        let parameters: Parameters = [
            "code": 0
        ]
        
        sessionManager.request("https://openapi.naver.com/v1/captcha/nkey", parameters : parameters).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            debugPrint(response.data)     // server data
            debugPrint(response.result)   // result of response serialization
            
            ex.fulfill()
            
            
            
            if let JSON = response.result.value {
                debugPrint("JSON: \(JSON)")
            }
        }
        
        print("ending")
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testParseJsonUsingSwiftyJSON() {
        let json = "{ \"people\": [{ \"firstName\": \"Paul\", \"lastName\": \"Hudson\", \"isAlive\": true }, { \"firstName\": \"Angela\", \"lastName\": \"Merkel\", \"isAlive\": true }, { \"firstName\": \"George\", \"lastName\": \"Washington\", \"isAlive\": false } ] }";
        
        if let data = json.data(using: String.Encoding.utf8) {
            let json = JSON(data: data)
            
            for item in json["people"].arrayValue {
                print(item["firstName"].stringValue)
            }
        }
    }
    
    func testObjectMapperWithAlamofire() {
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
            
            ex.fulfill()
            
            let weatherResponse = response.result.value
            print(weatherResponse?.location)
            
            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
