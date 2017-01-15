//
//  ViewController.swift
//  test
//
//  Created by olderor on 15.01.17.
//  Copyright © 2017 olderor. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<50 {
            print("generating \(i) test...")
            TestGenerator.generate(testIndex: i)
            print("done!")
        }
        
        
        var result = ""
        for i in 0..<50 {
            let isCorrect = runTest(index: i)
            if isCorrect {
                result += "Test #\(i) - OK.\n"
                print("Test #\(i) - OK.\n")
            } else {
                result += "Test #\(i) - WA.\n"
                print("Test #\(i) - WA.\n")
            }
        }
        print(result)
        BYFileManager.writeFile(path: "result", content: result)
    }
    
    
    
    func runMyTest(index: Int) {
        print("running my \(index) test...")
        let task = BYFileManager.readFile(path: "\(index)")
        let answer = TestManager.runTest(task)
        BYFileManager.writeFile(path: "\(index)t", content: answer)
        print("done!")
    }
    
    func runCorrectTest(index: Int) {
        
        if index > 19 {
            return
        }
        
        print("running correct \(index) test...")
        let task = BYFileManager.readFile(path: "\(index)")
        let answer = TestManager.getCorrectAnswer(task)
        BYFileManager.writeFile(path: "\(index)a", content: answer)
        print("done!")
    }
    
    func checkAnswer(index: Int) -> Bool {
        
        if index > 19 {
            return true
        }
        
        print("checking \(index) test...")
        let myAnswer = BYFileManager.readFile(path: "\(index)t")
        let correctAnswer = BYFileManager.readFile(path: "\(index)a")
        print("done!")
        
        let myData = myAnswer.components(separatedBy: "\n")
        let correctData = correctAnswer.components(separatedBy: "\n")
        
        if myData.count != correctData.count {
            return false
        }
        
        for i in 0..<myData.count - 1 {
            if myData[i] != correctData[i] {
                return false
            }
        }
        
        return true
    }
    
    func runTest(index: Int) -> Bool {
        runMyTest(index: index)
        runCorrectTest(index: index)
        return checkAnswer(index: index)
    }

}

