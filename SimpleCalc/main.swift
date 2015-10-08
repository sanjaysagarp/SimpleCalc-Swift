//
//  main.swift
//  SimpleCalc
//
//  Created by Sanjay Sagar on 10/7/15.
//  Copyright © 2015 Sanjay Sagar. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func factorial(num:Float) -> Float {
    if (num == 0) {
        return 1
    } else {
        return num * factorial(num-1)
    }
}
var active = true

while active {
    
    var result : Float = 0

    print("Enter an expression separated by returns:")

    var digit1 = input()
    var lineNum = digit1.componentsSeparatedByString(" ")
    var operand = lineNum[lineNum.count-1]
    var digit2 = ""
    var simpleOperand = digit2
    switch operand {
        case "count":
            result = Float(lineNum.count-1)
        case "avg":
            for index in 0...(lineNum.count-2) {
                result += Float(lineNum[index])!
            }
            result = result / Float(lineNum.count-1)
        case "fact":
            if(Float(lineNum[0])! % 1 == 0){
                result = factorial(Float(lineNum[0])!)
            } else {
                print("Invalid Integer")
            }
        case digit1:
            simpleOperand = input()
            break
        default:
            print("Unknown Command")
            break
    }



    //case check starts here for operands (digit2 is only needed for add/sub...etc)
    switch simpleOperand {
        //addition
        case "+":
            var digit2 = Float(input())
            result = Float(digit1)! + digit2!
        //subtraction
        case "-":
            var digit2 = Float(input())
            result = Float(digit1)! - digit2!
        case "*":
            var digit2 = Float(input())
            result = Float(digit1)! * digit2!
        case "%":
            var digit2 = Float(input())
            result = Float(digit1)! % digit2!
        case "/":
            var digit2 = Float(input())
            result = Float(digit1)! / digit2!
        case "count":
            var lineNum = digit1.componentsSeparatedByString(" ")
            result = Float(lineNum.count)
        case "avg":
            var lineNum = digit1.componentsSeparatedByString(" ")
            for index in 0...(lineNum.count-1) {
                result += Float(lineNum[index])!
            }
            result = result / Float(lineNum.count)
        case "fact":
            if(Float(digit1)! % 1 == 0){
                result = factorial(Float(digit1)!)
            } else {
                print("Invalid Integer")
            }
        default:
            break
    }

    if (result % 1 == 0) {
        print("Result: \(Int(result))")
    } else {
        print("Result: \(result)")
    }
}





