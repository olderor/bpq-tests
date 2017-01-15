//
//  TestGenerator.swift
//  test
//
//  Created by olderor on 15.01.17.
//  Copyright © 2017 olderor. All rights reserved.
//

import Foundation

class TestGenerator {
    
    static func generate(testIndex: Int) {
        var task = ""
        var size = 0
        
        switch testIndex {
        case 0..<10:
            size = 100
            break
        case 10..<20:
            size = 1_000
            break
        case 20..<30:
            size = 10_000
            break
        case 30..<40:
            size = 100_000
            break
        default:
            size = 1_000_000
            break
        }
        
        switch testIndex % 10 {
        case 0:
            task = generateZigZag(size: size)
            break
        case 1:
            task = generateIncreasing(size: size)
            break
        case 2:
            task = generateDecreasing(size: size)
            break
        case 3:
            task = generateZero(size: size)
            break
        case 4:
            task = generatePushPop(size: size)
            break
        case 5:
            task = generateTop(size: size)
            break
        case 6:
            task = generatePushPopIncreasing(size: size)
            break
        case 7:
            task = generatePushPopRandom(size: size)
            break
        case 8:
            task = generateRandom(size: size)
            break
        case 9:
            task = generateRandomPushPop(size: size)
            break
        default:
            break
        }
        BYFileManager.writeFile(path: "\(testIndex)", content: task)
    }
    
    static private func generateZigZag(size: Int) -> String {
        var task = ""
        for i in 0..<size {
            task += "\(i)\n"
            task += "top\n"
            task += "\(size - i - 1)\n"
            task += "top\n"
        }
        for _ in 0..<size * 2 {
            task += "pop\n"
        }
        return task
    }
    
    static private func generateIncreasing(size: Int) -> String {
        var task = ""
        for i in 0..<size {
            task += "\(i)\n"
            task += "top\n"
        }
        for _ in 0..<size {
            task += "pop\n"
        }
        return task
    }
    
    static private func generateDecreasing(size: Int) -> String {
        var task = ""
        for i in 0..<size {
            task += "\(size - i)\n"
            task += "top\n"
        }
        for _ in 0..<size {
            task += "pop\n"
        }
        return task
    }
    
    static private func generateZero(size: Int) -> String {
        var task = ""
        for _ in 0..<size {
            task += "0\n"
            task += "top\n"
        }
        for _ in 0..<size {
            task += "pop\n"
            task += "top\n"
        }
        return task
    }
    
    static private func generatePushPop(size: Int) -> String {
        var task = ""
        for i in 0..<size {
            task += "\(i)\n"
            task += "top\n"
            task += "pop\n"
            task += "top\n"
        }
        return task
    }
    
    static private func generateTop(size: Int) -> String {
        var task = ""
        task += "0\n"
        for _ in 0..<size {
            task += "top\n"
        }
        return task
    }
    
    static private func generatePushPopIncreasing(size: Int) -> String {
        var task = ""
        for var i in 0..<size {
            task += "\(i)\n"
            task += "top\n"
            i += 1
            task += "\(i)\n"
            task += "top\n"
            task += "pop\n"
        }
        return task
    }
    
    static private func generatePushPopRandom(size: Int) -> String {
        var task = ""
        for var i in 0..<size {
            task += "\(Int(arc4random() % 2147483647))\n"
            task += "top\n"
            i += 1
            task += "\(Int(arc4random() % 2147483647))\n"
            task += "top\n"
            task += "pop\n"
        }
        return task
    }
    
    static private func generateRandom(size: Int) -> String {
        var task = ""
        for _ in 0..<size {
            task += "\(Int(arc4random() % 2147483647))\n"
            task += "top\n"
        }
        for _ in 0..<size {
            task += "pop\n"
            task += "top\n"
        }
        return task
    }
    
    static private func generateRandomPushPop(size: Int) -> String {
        var task = ""
        for _ in 0..<size {
            if arc4random() % 2 == 0 {
                task += "\(Int(arc4random() % 2147483647))\n"
                task += "top\n"
            } else {
                task += "pop\n"
                task += "top\n"
            }
        }
        return task
    }
    
}
