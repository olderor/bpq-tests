//
//  TestManager.swift
//  test
//
//  Created by olderor on 15.01.17.
//  Copyright © 2017 olderor. All rights reserved.
//

import Foundation


extension UInt64 {
    var beautifulString: String {
        if self == 0 {
            return "0"
        }
        var result = ""
        var value = self
        var count = -1
        while value != 0 {
            if count % 3 == 2 {
                result = " " + result
            }
            result = "\(value % 10)" + result
            value /= 10
            count += 1
        }
        return result
    }
}

class TestManager {
    
    static func runTest(_ task: String) -> String {
        let start = DispatchTime.now()
        
        let queue = BrodalPriorityQueue<Int>()
        let data = task.components(separatedBy: "\n")
        var result = ""
        for index in 0..<data.count - 1 {
            if data[index] == "pop" {
                let value = queue.extractMin()
                result += (value == nil ? "nil" : "\(value!)") + "\n"
            } else if data[index] == "top" {
                let value = queue.first
                result += (value == nil ? "nil" : "\(value!)") + "\n"
            } else {
                queue.insert(element: Int(data[index])!)
            }
        }
        
        let end = DispatchTime.now()
        
        let interval = end.uptimeNanoseconds - start.uptimeNanoseconds
        print("elapsed within \(interval.beautifulString) nanosecs")
        result += "\nelapsed within \(interval.beautifulString) nanosecs."
        
        return result
    }
    
    static func getCorrectAnswer(_ task: String) -> String {
        let start = DispatchTime.now()
        
        var elements = [Int]()
        let data = task.components(separatedBy: "\n")
        var result = ""
        for index in 0..<data.count - 1 {
            if data[index] == "pop" {
                elements = elements.sorted()
                if elements.count > 0 {
                    result += "\(elements[0])\n"
                    elements.remove(at: 0)
                } else {
                    result += "nil\n"
                }
            } else if data[index] == "top" {
                elements = elements.sorted()
                if elements.count > 0 {
                    result += "\(elements[0])\n"
                } else {
                    result += "nil\n"
                }
            } else {
                elements.append(Int(data[index])!)
            }
        }
        
        let end = DispatchTime.now()
        
        let interval = end.uptimeNanoseconds - start.uptimeNanoseconds
        print("elapsed within \(interval.beautifulString) nanosecs")
        result += "\nelapsed within \(interval.beautifulString) nanosecs."
        
        return result
    }
}
