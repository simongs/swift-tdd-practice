//
//  BrainTests.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import XCTest
import Alamofire
@testable import FizzBuzz

class BrainTests: XCTestCase {
    
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
    
    func testExample() {
        
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
    
    func test() {
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
    
    
    func testAlamofire() {
        let testurl = "https://openapi.naver.com/v1/captcha/ncaptcha.bin"
        
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        var defaultHeaders = SessionManager.defaultHTTPHeaders
        defaultHeaders["X-Naver-Client-Id"] = "AoO5aDFVlQ7eAfKWkWNA"
        defaultHeaders["X-Naver-Client-Secret"] = "s87HwTaG9i"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        let parameters: Parameters = [
            "key": "XHAwbgq2HdIQYZg1"
        ]
        
        sessionManager.download(testurl, parameters : parameters).responseData { response in
            ex.fulfill()
            
            if let data = response.result.value {
                var image = UIImage(data: data)
                print("ending")
            }
        }
        
        
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
}
