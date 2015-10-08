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

func convert(incoming:String) -> Float {
    return NSNumberFormatter().numberFromString(incoming)!.floatValue
}

func factorial(num:Float) -> Float {
    if (num == 0) {
        return 1
    } else {
        return num * factorial(num-1)
    }
}

// should implement option to quit?
var active = true

while active {
    
    var result : Float = 0

    print("Enter an expression separated by returns:")

    var digit1 = input()
    var operand = input()



    //case check starts here for operands (digit2 is only needed for add/sub...etc)
    switch operand {
        //addition
        case "+":
            var digit2 = convert(input())
            result = convert(digit1) + digit2
        //subtraction
        case "-":
            var digit2 = convert(input())
            result = convert(digit1) - digit2
        //multiplication
        case "*":
            var digit2 = convert(input())
            result = convert(digit1) * digit2
        //mod
        case "%":
            var digit2 = convert(input())
            result = convert(digit1) % digit2
        //division
        case "/":
            var digit2 = convert(input())
            result = convert(digit1) / digit2
        // count numbers
        case "count":
            var lineNum = digit1.componentsSeparatedByString(" ")
            result = Float(lineNum.count)
        // average
        case "avg":
            var lineNum = digit1.componentsSeparatedByString(" ")
            for index in 0...(lineNum.count-1) {
                result += convert(lineNum[index])
            }
            result = result / Float(lineNum.count)
        // factoral
        case "fact":
            var lineNum = digit1.componentsSeparatedByString(" ")
            if(convert(lineNum[0]) % 1 == 0){
                result = factorial(convert(lineNum[0]))
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





