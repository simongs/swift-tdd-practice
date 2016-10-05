//
//  BrainTests.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import XCTest
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
    
}
