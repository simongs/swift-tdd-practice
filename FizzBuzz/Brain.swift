//
//  Brain.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 5..
//  Copyright © 2016년 simons. All rights reserved.
//

import Foundation

class Brain: NSObject {
    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(divisor: 3, number: number);
    }
    
    func isDivisibleByFive(number : Int) -> Bool {
        if number % 5 == 0 {
            return true
        } else {
            return false
        }
    }
    
    func isDivisibleByFifteen(number : Int) -> Bool {
        return isDivisibleBy(divisor: 15, number: number);
    }
    
    func isDivisibleBy(divisor : Int, number : Int) -> Bool {
        return number % divisor == 0;
    }
    
    func check(number : Int) -> String {
        if (isDivisibleByFifteen(number: number)) {
            return "FizzBuzz"
        } else if (isDivisibleByThree(number: number)) {
            return "Fizz"
        } else if (isDivisibleByFive(number: number)) {
            return "Buzz"
        }
        return String(number)
    }
}
